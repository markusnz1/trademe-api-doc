# Trade Me API Documentation

Documentation for Trade Me's API in OpenAPI format, both individual files and transformable into a single consolidated file. Also, a few simple tools and workflows for extracting and processing Trade Me's API documentation from the official Trade Me developer site.

## Overview

**OpenAPI Implementation**: The repository includes a comprehensive OpenAPI 3.1 specification with:

- **240 endpoint paths**: Complete coverage of Trade Me API (Listings, Categories, Search, My Trade Me, Selling, Property, Jobs, and more)
- **423 schema components**: All data structures including requests, responses, and nested objects
- **35 API categories**: Organized by functional area with proper tagging
- **Authentication models**: OAuth 1.0a configuration for Trade Me API access
- **Both formats**: YAML (2.6MB) and JSON (3.2MB) specifications available
- **Interactive documentation**: Swagger UI integration for testing and exploration

**Legacy Sample Implementation**: A proof-of-concept implementation with 5 endpoints is also available in the repository for reference.

## Dataset Structure (data/)

### Raw Data

- **`data/downloaded-specs/`** - Original HTML documentation files from Trade Me developer portal as at September 2025. Downloaded with `curl` - see **`scripts/download-trademe-docs.sh`**
- **`data/stripped-specs/`** - HTML files with cleaned formatting (removed navigation, ads, etc.) used prior to formatting in OpenAPI specification. See **`specs/strip-html-from-docs.md`** for a helpful Claude context prompt to help transform downloaded-specs (**`data/downloaded-specs/`**) into stripped 'specs' (**`data/stripped-specs`**)
- **`data/trademe-api-downloaded-specs-20250902.tar.gz`** - Compressed backup of original files

### Processed Data

- **`data/json-doc/`** - Structured JSON specifications for 265 active endpoints (deprecated endpoints excluded)

## Scripts and Specs

### Scripts

- **`scripts/generate-complete-openapi.js`** - **NEW!** Generate complete OpenAPI 3.1 spec from all 265 endpoints (423 schemas, 240 paths)
- **`scripts/generate-download-script.py`** - Generate download script from JSON specs
- **`scripts/download-trademe-docs.sh`** - Download official Trade Me API developer documentation (all 265 endpoints)
- **`scripts/generate-openapi-schemas.js`** - Legacy: Sample OpenAPI schema generator for single endpoint
- **`scripts/browse-api.sh`** - Generate consolidated YAML and launch Swagger UI
- **`scripts/stop-api-server.sh`** - Stop the local Docker web server

See **`scripts/README.md`** for detailed documentation.

### Specs

- **`specs/json-extraction-guide.md`** - Complete schema and extraction methodology
- **`specs/generate-doc.md`** - Documentation generation workflow
- **`specs/strip-html-from-docs.md`** - HTML cleaning process

## Purpose

This project provides an example of a simple, clean OpenAPI-based structure to represent the documentation of Trade Me's API.

## API Coverage

The project includes comprehensive extraction and OpenAPI transformation of the Trade Me API:

- **265 JSON specifications**: Complete endpoint documentation with parameters, schemas, and examples
- **263 OpenAPI endpoints**: Full OpenAPI 3.1 specification (2 endpoints excluded due to incomplete source data)
- **423 schemas**: All request/response types with nested objects and enumerations
- **35 API categories**: Address, Bidding, Branding, Catalogue, Document Service, Favourites, Fixed Price Offers, Jobs, Listings, Membership, My Trade Me, OAuth, Photos, Ping, Property, Renti, Search, Selling, SEO, Shipping, and Suburb Search methods

**Available Specifications**:
- **Complete**: `openapi/trademe-api.yaml` - Full API specification (2.6MB, 240 paths, 423 schemas)
- **Legacy Sample**: `openapi/api.yaml` - Proof-of-concept with 5 endpoints for reference

Note that deprecated endpoints have been intentionally excluded from the dataset.

## Using the Dataset

### Generating the Complete OpenAPI Specification

**Generate complete OpenAPI spec from all 265 JSON endpoints:**

```bash
# Install dependencies (first time only)
npm install js-yaml

# Generate complete OpenAPI specification
node scripts/generate-complete-openapi.js

# Output:
#   openapi/trademe-api.yaml (2.6MB, 240 paths, 423 schemas)
#   openapi/trademe-api.json (3.2MB)
```

### Browsing the OpenAPI Specification (Swagger)

**View the complete API specification:**

```bash
# View complete specification in Swagger UI
docker run -d -p 5353:8080 --name trademe-api-docs --rm \
  -e SWAGGER_JSON=/openapi/trademe-api.yaml \
  -v "$(pwd)/openapi:/openapi" swaggerapi/swagger-ui

# Open browser to: http://localhost:5353

# Stop server: docker stop trademe-api-docs
```

**View the legacy sample (5 endpoints):**

```bash
# Generate consolidated spec, start server, and open in browser
./scripts/browse-api.sh
```

**Prerequisites:** Docker (for Swagger UI), Node.js and js-yaml (for generation)

## Use Cases

- **API Documentation Projects** - Foundation for comprehensive API documentation efforts
- **Extraction Methodology** - Beginner workflows for HTML-to-structured-data conversion
- **OpenAPI Development** - Sample specifications and generation workflows
- **API Analysis** - Study API design patterns and documentation structures
- **Development Tools** - Scripts and processes for API documentation automation

## Data Sources

All content was extracted from the official Trade Me Developer Documentation:

- **Source**: [developer.trademe.co.nz](https://developer.trademe.co.nz/)
- **Extraction Date**: September 2025
- **Coverage**: 265 active API endpoints (deprecated endpoints excluded)

The processing maintained complete traceability - each endpoint specification includes the original source URL.

## License & Usage

See [LICENSE.md](LICENSE.md) for complete licensing information and usage terms.

---

**Project Status**: Comprehensive JSON extraction complete (265 active endpoints), sample OpenAPI implementation (5 endpoints)  
**Source**: Trade Me Developer Documentation  
**Processing**: Automated extraction with manual validation  
**Next Steps**: Scale OpenAPI transformation to remaining 260 endpoints
