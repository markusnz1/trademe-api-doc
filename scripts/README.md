# Trade Me API Documentation Scripts

This directory contains scripts for downloading and managing Trade Me API documentation.

## Scripts

### generate-complete-openapi.js

**NEW!** Generates a complete OpenAPI 3.1 specification from all 265 Trade Me API endpoint JSON specs.

**Purpose**: Creates comprehensive OpenAPI specification files (YAML and JSON) that include all endpoints, schemas, parameters, and responses from the entire Trade Me API.

**Usage**:
```bash
node scripts/generate-complete-openapi.js
```

**What it does**:
- Processes all 265 JSON endpoint specifications
- Generates 423 component schemas
- Creates 240 API path definitions
- Outputs both YAML and JSON formats
- Includes OAuth 1.0a security definitions
- Organizes endpoints by category tags
- Handles nested object types and enumerations

**Output**:
- `openapi/trademe-api.yaml` (2.6MB, 65,489 lines)
- `openapi/trademe-api.json` (3.2MB)

**Features**:
- Complete parameter definitions (path and query)
- Request body schemas
- Response schemas with status codes
- Security requirements per endpoint
- Proper type conversions (string, integer, boolean, datetime, arrays, objects)
- Enum value handling with descriptions
- Nested schema generation
- Reference-based schema reuse

**Requirements**:
- Node.js
- js-yaml package (install with: `npm install js-yaml`)

### generate-openapi-schemas.js

**LEGACY** - Original proof-of-concept script that only generates schemas for a single endpoint (retrieve-the-details-of-a-single-listing). Replaced by `generate-complete-openapi.js` for comprehensive OpenAPI generation.

### generate-download-script.py

Generates a comprehensive download script from JSON spec files.

**Purpose**: Automatically creates `download-trademe-docs.sh` with download commands for all 265 Trade Me API endpoints by reading the `source` URLs from each JSON spec file.

**Usage**:
```bash
python3 scripts/generate-download-script.py
```

**What it does**:
- Scans all JSON files in `data/json-doc/`
- Extracts the `source` URL from each endpoint specification
- Generates organized download commands grouped by API category
- Creates an executable bash script at `scripts/download-trademe-docs.sh`
- Outputs summary statistics (total endpoints, categories)

**Output**:
- Generates: `scripts/download-trademe-docs.sh` (384 lines, 265 endpoints across 35 categories)

### download-trademe-docs.sh

Downloads HTML documentation from Trade Me Developer Portal.

**Purpose**: Downloads all Trade Me API endpoint documentation pages from developer.trademe.co.nz

**Usage**:
```bash
./scripts/download-trademe-docs.sh
```

**Features**:
- Downloads 265 active endpoint documentation pages
- Organizes files by API category (35 categories)
- Handles errors gracefully with retry logic
- Includes 0.5 second delay between downloads to be respectful to the server
- Shows progress with success/failure indicators

**Output Directory**: `data/downloaded-specs/`

**Categories Covered**:
- Address Methods (1)
- Bidding and Buying Methods (3)
- Branding Methods (5)
- Catalogue Methods (28)
- Document Service Methods (4)
- Favourite Methods (10)
- Fixed Price Offer Methods (4)
- Job Agent Methods (4)
- Job Company Methods (4)
- Job Listing Methods (5)
- Job Position Methods (6)
- Jobs Catalogue Methods (3)
- Jobs Payment Methods (4)
- Listing Enquiries Methods (3)
- Listing Methods (16)
- Membership Methods (18)
- My Trade Me Methods (32)
- OAuth Methods (1)
- Photo Methods (2)
- Ping Methods (1)
- Property Agency Methods (10)
- Property Agent Methods (11)
- Property Map Methods (1)
- Property Partnership Agreement Methods (1)
- Property Sold Search Methods (2)
- Property Timeline Methods (2)
- Renti Methods (2)
- Search Methods (18)
- Selling Methods (30)
- SEO Methods for Dynamic Pages Directory (3)
- SEO Methods for Internal Linking (1)
- SEO Methods for Landing Page Content (4)
- SEO Methods for Menu Links (1)
- Shipping Methods (7)
- Suburb Search Methods (2)

### browse-api.sh

Starts a local API documentation server.

**Usage**:
```bash
./scripts/browse-api.sh
```

### stop-api-server.sh

Stops the running API documentation server.

**Usage**:
```bash
./scripts/stop-api-server.sh
```

## Workflow

### Initial Setup / Re-downloading Documentation

1. **Generate the download script** (if JSON specs have been updated):
   ```bash
   python3 scripts/generate-download-script.py
   ```

2. **Download all documentation**:
   ```bash
   ./scripts/download-trademe-docs.sh
   ```

   This will download all 265 endpoints to `data/downloaded-specs/`

3. **Browse the documentation locally** (optional):
   ```bash
   ./scripts/browse-api.sh
   ```

### Updating Documentation

If Trade Me adds new endpoints or updates existing ones:

1. Update the JSON spec files in `data/json-doc/`
2. Regenerate the download script: `python3 scripts/generate-download-script.py`
3. Re-download: `./scripts/download-trademe-docs.sh`

## Technical Details

### Download Script Generation

The `generate-download-script.py` script:
- Reads all `*.json` files from `data/json-doc/**/*`
- Extracts the `source` field containing the documentation URL
- Groups endpoints by category directory
- Generates bash commands with proper error handling
- Creates an executable script with 0.5s delays between requests

### File Structure

```
scripts/
├── README.md                      # This file
├── generate-download-script.py   # Generator script
├── download-trademe-docs.sh      # Generated download script (auto-generated)
├── browse-api.sh                 # Start documentation server
└── stop-api-server.sh            # Stop documentation server

data/
├── json-doc/                     # Source JSON specs (265 files)
│   ├── catalogue-methods/
│   ├── search-methods/
│   └── ... (35 categories)
└── downloaded-specs/             # Downloaded HTML files (274 files)
    ├── catalogue-methods/
    ├── search-methods/
    └── ... (37 directories)
```

## Notes

- The download script includes a 0.5 second delay between requests to be respectful to Trade Me's servers
- Failed downloads are logged but don't stop the script
- The script automatically creates necessary directories
- All 265 active endpoints are included (deprecated endpoints excluded)
- The generator script must be run from the repository root directory
