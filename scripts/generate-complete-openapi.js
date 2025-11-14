#!/usr/bin/env node

/**
 * Complete Trade Me OpenAPI Specification Generator
 *
 * Generates a full OpenAPI 3.1 specification from all 265 Trade Me JSON endpoint specs
 */

const fs = require('fs');
const path = require('path');
const yaml = require('js-yaml');

class CompleteOpenAPIGenerator {
    constructor() {
        this.schemas = {};
        this.paths = {};
        this.processedTypes = new Set();
        this.schemaNameCounter = new Map(); // Track duplicate schema names
    }

    /**
     * Convert Trade Me type to OpenAPI type
     */
    convertType(tradeMeType, fieldName = '') {
        if (!tradeMeType) return { type: 'string' };

        const typeStr = String(tradeMeType).toLowerCase();
        const isNullable = typeStr.includes(' or null');
        const baseType = typeStr.replace(' or null', '').replace(/\(.*?\)/, '').trim();

        let schema = {};

        if (baseType.includes('string')) {
            schema = { type: 'string' };
        } else if (baseType.includes('integer')) {
            schema = { type: 'integer', format: 'int32' };
        } else if (baseType.includes('long')) {
            schema = { type: 'integer', format: 'int64' };
        } else if (baseType.includes('number') || baseType.includes('decimal')) {
            schema = { type: 'number', format: 'double' };
        } else if (baseType.includes('boolean')) {
            schema = { type: 'boolean' };
        } else if (baseType.includes('datetime')) {
            schema = { type: 'string', format: 'date-time' };
        } else if (baseType.includes('date')) {
            schema = { type: 'string', format: 'date' };
        } else if (baseType.includes('enumeration')) {
            schema = { type: 'string' };
        } else if (baseType.startsWith('collection of')) {
            const itemType = baseType.replace('collection of', '').trim();
            schema = {
                type: 'array',
                items: this.convertType(itemType)
            };
        } else if (baseType.startsWith('<') && baseType.endsWith('>')) {
            const refType = baseType.slice(1, -1);
            return { $ref: `#/components/schemas/${refType}` };
        } else {
            schema = { type: 'string' };
        }

        if (isNullable) {
            schema.nullable = true;
        }

        return schema;
    }

    /**
     * Generate unique schema name to avoid conflicts
     */
    getUniqueSchemaName(baseName) {
        if (!this.schemaNameCounter.has(baseName)) {
            this.schemaNameCounter.set(baseName, 0);
            return baseName;
        }

        const count = this.schemaNameCounter.get(baseName) + 1;
        this.schemaNameCounter.set(baseName, count);
        return `${baseName}${count}`;
    }

    /**
     * Process enum values
     */
    processEnum(field) {
        const enumList = field.enum || field.enum_values;
        if (!enumList || enumList.length === 0) return {};

        const values = enumList.map(e => e.value || e.name);
        const descriptions = enumList.filter(e => e.description).map(e => e.description);

        const result = { enum: values };
        if (descriptions.length > 0) {
            result['x-enum-descriptions'] = descriptions;
        }

        return result;
    }

    /**
     * Generate schema from fields
     */
    generateSchemaFromFields(fields, schemaName) {
        if (!fields || fields.length === 0) {
            return { type: 'object', additionalProperties: true };
        }

        const properties = {};
        const required = [];

        for (const field of fields) {
            const fieldName = field.name || field.field_name;
            if (!fieldName) continue;

            const fieldType = field.type || field.field_type;
            let fieldSchema = this.convertType(fieldType, fieldName);

            // Add description
            if (field.description) {
                fieldSchema.description = field.description;
            }

            // Add enum values
            if (field.enum || field.enum_values) {
                Object.assign(fieldSchema, this.processEnum(field));
            }

            // Handle nested fields
            if (field.nested_fields && field.nested_fields.length > 0) {
                const nestedSchemaName = `${schemaName}${fieldName}`;
                const nestedSchema = this.generateSchemaFromFields(field.nested_fields, nestedSchemaName);

                this.schemas[nestedSchemaName] = nestedSchema;
                fieldSchema = { $ref: `#/components/schemas/${nestedSchemaName}` };
            }

            properties[fieldName] = fieldSchema;

            if (field.required) {
                required.push(fieldName);
            }
        }

        const schema = {
            type: 'object',
            properties
        };

        if (required.length > 0) {
            schema.required = required;
        }

        return schema;
    }

    /**
     * Convert JSON spec to OpenAPI path item
     */
    processEndpoint(jsonSpec) {
        const { endpoint, title, description, url, method, parameters, request_body, returns, authentication_required, source } = jsonSpec;

        // Skip endpoints with missing critical data
        if (!method || !url) {
            console.warn(`⚠️  Skipping ${endpoint}: missing method or URL`);
            return;
        }

        // Parse the URL path
        const urlPath = url ? url.replace('https://api.trademe.co.nz/v1', '').replace('.{file_format}', '') : '/unknown';

        // Initialize path if not exists
        if (!this.paths[urlPath]) {
            this.paths[urlPath] = {};
        }

        const operation = {
            summary: title || endpoint,
            description: description || '',
            operationId: endpoint,
            tags: [this.getCategoryFromSource(source)],
            parameters: []
        };

        // Add parameters
        if (parameters) {
            // Path parameters
            if (parameters.path) {
                for (const param of parameters.path) {
                    operation.parameters.push({
                        name: param.name,
                        in: 'path',
                        description: param.description || '',
                        required: param.required || true,
                        schema: this.convertType(param.type)
                    });
                }
            }

            // Query parameters
            if (parameters.query) {
                for (const param of parameters.query) {
                    operation.parameters.push({
                        name: param.name,
                        in: 'query',
                        description: param.description || '',
                        required: param.required || false,
                        schema: this.convertType(param.type)
                    });
                }
            }
        }

        // Add request body
        if (request_body && request_body.fields) {
            const requestSchemaName = `${endpoint}Request`;
            const requestSchema = this.generateSchemaFromFields(request_body.fields, requestSchemaName);
            this.schemas[requestSchemaName] = requestSchema;

            operation.requestBody = {
                description: request_body.description || 'Request body',
                required: true,
                content: {
                    'application/json': {
                        schema: { $ref: `#/components/schemas/${requestSchemaName}` }
                    }
                }
            };
        }

        // Add response
        if (returns) {
            const responseSchemaName = `${endpoint}Response`;
            let responseSchema;

            if (returns.fields && returns.fields.length > 0) {
                responseSchema = this.generateSchemaFromFields(returns.fields, responseSchemaName);
                this.schemas[responseSchemaName] = responseSchema;
            }

            operation.responses = {
                '200': {
                    description: returns.description || 'Successful response',
                    content: {
                        'application/json': {
                            schema: responseSchema
                                ? { $ref: `#/components/schemas/${responseSchemaName}` }
                                : { type: 'object' }
                        }
                    }
                },
                '400': {
                    description: 'Bad request'
                },
                '401': {
                    description: 'Unauthorized'
                },
                '404': {
                    description: 'Not found'
                }
            };
        }

        // Add security if authentication required
        if (authentication_required) {
            operation.security = [{ OAuth1: [] }];
        }

        // Set the operation on the path
        this.paths[urlPath][method.toLowerCase()] = operation;
    }

    /**
     * Extract category from source URL
     */
    getCategoryFromSource(sourceUrl) {
        if (!sourceUrl) return 'General';

        const match = sourceUrl.match(/\/api-reference\/([^\/]+)\//);
        if (match) {
            return match[1].split('-').map(word =>
                word.charAt(0).toUpperCase() + word.slice(1)
            ).join(' ');
        }

        return 'General';
    }

    /**
     * Generate complete OpenAPI specification
     */
    generateOpenAPISpec() {
        return {
            openapi: '3.1.0',
            info: {
                title: 'Trade Me API',
                version: '1.0.0',
                description: 'Complete Trade Me API specification generated from official documentation',
                contact: {
                    name: 'Trade Me API Support',
                    url: 'https://developer.trademe.co.nz'
                }
            },
            servers: [
                {
                    url: 'https://api.trademe.co.nz/v1',
                    description: 'Production server'
                },
                {
                    url: 'https://api.tmsandbox.co.nz/v1',
                    description: 'Sandbox server'
                }
            ],
            tags: this.generateTags(),
            paths: this.paths,
            components: {
                schemas: this.schemas,
                securitySchemes: {
                    OAuth1: {
                        type: 'oauth',
                        flows: {
                            authorizationCode: {
                                authorizationUrl: 'https://secure.trademe.co.nz/Oauth/Authorize',
                                tokenUrl: 'https://secure.trademe.co.nz/Oauth/AccessToken',
                                scopes: {}
                            }
                        },
                        description: 'OAuth 1.0a authentication'
                    }
                }
            }
        };
    }

    /**
     * Generate tags from processed endpoints
     */
    generateTags() {
        const tagSet = new Set();

        for (const path of Object.values(this.paths)) {
            for (const operation of Object.values(path)) {
                if (operation.tags) {
                    operation.tags.forEach(tag => tagSet.add(tag));
                }
            }
        }

        return Array.from(tagSet).sort().map(tag => ({
            name: tag,
            description: `${tag} operations`
        }));
    }

    /**
     * Process all JSON specs in a directory
     */
    processAllSpecs(jsonDocDir) {
        console.log('Processing all JSON specifications...\n');

        let processedCount = 0;
        let errorCount = 0;

        const processDirectory = (dir) => {
            const entries = fs.readdirSync(dir, { withFileTypes: true });

            for (const entry of entries) {
                const fullPath = path.join(dir, entry.name);

                if (entry.isDirectory()) {
                    processDirectory(fullPath);
                } else if (entry.isFile() && entry.name.endsWith('.json')) {
                    try {
                        const jsonContent = fs.readFileSync(fullPath, 'utf8');
                        const jsonSpec = JSON.parse(jsonContent);

                        this.processEndpoint(jsonSpec);
                        processedCount++;

                        if (processedCount % 50 === 0) {
                            console.log(`Processed ${processedCount} endpoints...`);
                        }
                    } catch (error) {
                        console.error(`Error processing ${fullPath}: ${error.message}`);
                        errorCount++;
                    }
                }
            }
        };

        processDirectory(jsonDocDir);

        console.log(`\n✅ Processed ${processedCount} endpoints`);
        console.log(`📦 Generated ${Object.keys(this.schemas).length} schemas`);
        console.log(`🛣️  Generated ${Object.keys(this.paths).length} paths`);

        if (errorCount > 0) {
            console.log(`⚠️  ${errorCount} errors encountered`);
        }

        return { processedCount, errorCount };
    }

    /**
     * Write OpenAPI spec to file
     */
    writeSpec(outputPath, format = 'yaml') {
        const spec = this.generateOpenAPISpec();

        if (format === 'yaml') {
            const yamlContent = yaml.dump(spec, {
                indent: 2,
                lineWidth: -1,
                noRefs: false
            });
            fs.writeFileSync(outputPath, yamlContent);
        } else {
            fs.writeFileSync(outputPath, JSON.stringify(spec, null, 2));
        }

        console.log(`\n📄 OpenAPI specification written to: ${outputPath}`);
    }
}

// Main execution
async function main() {
    const generator = new CompleteOpenAPIGenerator();

    const jsonDocDir = path.join(__dirname, '..', 'data', 'json-doc');
    const outputDir = path.join(__dirname, '..', 'openapi');

    // Ensure output directory exists
    if (!fs.existsSync(outputDir)) {
        fs.mkdirSync(outputDir, { recursive: true });
    }

    try {
        console.log('='.repeat(70));
        console.log('Trade Me Complete OpenAPI Specification Generator');
        console.log('='.repeat(70));
        console.log();

        // Process all specs
        const stats = generator.processAllSpecs(jsonDocDir);

        // Write YAML and JSON versions
        generator.writeSpec(path.join(outputDir, 'trademe-api.yaml'), 'yaml');
        generator.writeSpec(path.join(outputDir, 'trademe-api.json'), 'json');

        console.log();
        console.log('='.repeat(70));
        console.log('✅ Complete OpenAPI specification generated successfully!');
        console.log('='.repeat(70));
        console.log();
        console.log('Next steps:');
        console.log('  1. Review the generated specification: openapi/trademe-api.yaml');
        console.log('  2. Validate with: npx @redocly/cli lint openapi/trademe-api.yaml');
        console.log('  3. Generate documentation: npx @redocly/cli build-docs openapi/trademe-api.yaml');
        console.log();

    } catch (error) {
        console.error('❌ Error generating OpenAPI specification:', error.message);
        console.error(error.stack);
        process.exit(1);
    }
}

// Check for required dependencies
try {
    require.resolve('js-yaml');
} catch (error) {
    console.error('❌ js-yaml package not found. Please run: npm install js-yaml');
    process.exit(1);
}

if (require.main === module) {
    main();
}

module.exports = { CompleteOpenAPIGenerator };
