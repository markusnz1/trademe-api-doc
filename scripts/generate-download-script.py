#!/usr/bin/env python3
"""
Generate comprehensive download script from JSON spec files.
This script reads all JSON specs and creates download commands for each endpoint.
"""

import json
import os
from pathlib import Path
from urllib.parse import urlparse

def main():
    # Base directory containing JSON specs
    json_doc_dir = Path("data/json-doc")

    if not json_doc_dir.exists():
        print(f"Error: {json_doc_dir} does not exist")
        return

    # Collect all JSON files and their source URLs
    endpoints = []

    for json_file in sorted(json_doc_dir.glob("**/*.json")):
        try:
            with open(json_file, 'r', encoding='utf-8') as f:
                spec = json.load(f)

            source_url = spec.get('source')
            if not source_url:
                print(f"Warning: No source URL in {json_file}")
                continue

            # Extract category and endpoint name from file path
            relative_path = json_file.relative_to(json_doc_dir)
            category = relative_path.parent.name
            endpoint_file = relative_path.stem + ".html"

            # Parse URL to get the path component
            parsed = urlparse(source_url)
            url_path = parsed.path.replace('/api-reference/', '')

            endpoints.append({
                'source_url': source_url,
                'category': category,
                'endpoint_file': endpoint_file,
                'url_path': url_path,
                'title': spec.get('title', 'Unknown')
            })

        except Exception as e:
            print(f"Error processing {json_file}: {e}")

    print(f"Found {len(endpoints)} endpoints")

    # Generate the download script
    script_lines = [
        '#!/bin/bash',
        '',
        '# Trade Me API Documentation Download Script',
        '# Auto-generated from JSON spec files',
        f'# Total endpoints: {len(endpoints)}',
        '',
        'set -e',
        '',
        'BASE_URL="https://developer.trademe.co.nz/api-reference"',
        'OUTPUT_DIR="data/downloaded-specs"',
        '',
        '# Create output directory if it doesn\'t exist',
        'mkdir -p "$OUTPUT_DIR"',
        '',
        'echo "Downloading Trade Me API documentation..."',
        'echo "Base URL: $BASE_URL"',
        'echo "Output directory: $OUTPUT_DIR"',
        f'echo "Total endpoints: {len(endpoints)}"',
        'echo ""',
        '',
        '# Function to download a page and save to appropriate directory',
        'download_page() {',
        '    local url="$1"',
        '    local output_path="$2"',
        '    local category_dir=$(dirname "$output_path")',
        '    ',
        '    # Create category directory if it doesn\'t exist',
        '    mkdir -p "$OUTPUT_DIR/$category_dir"',
        '    ',
        '    echo "Downloading: $url"',
        '    echo "  -> $OUTPUT_DIR/$output_path"',
        '    ',
        '    # Download with curl, following redirects and handling errors',
        '    if curl -s -L -f "$url" -o "$OUTPUT_DIR/$output_path"; then',
        '        echo "  ✓ Success"',
        '    else',
        '        echo "  ✗ Failed to download $url"',
        '    fi',
        '    ',
        '    # Small delay to be respectful to the server',
        '    sleep 0.5',
        '}',
        '',
        'DOWNLOADED=0',
        'FAILED=0',
        ''
    ]

    # Group endpoints by category for better organization
    from collections import defaultdict
    by_category = defaultdict(list)
    for ep in endpoints:
        by_category[ep['category']].append(ep)

    # Add download commands for each category
    for category in sorted(by_category.keys()):
        category_endpoints = by_category[category]
        script_lines.append(f'# {category.upper().replace("-", " ")} ({len(category_endpoints)} endpoints)')

        for ep in category_endpoints:
            output_path = f"{category}/{ep['endpoint_file']}"
            script_lines.append(f'download_page "$BASE_URL/{ep["url_path"]}" "{output_path}"')

        script_lines.append('')

    # Add summary at the end
    script_lines.extend([
        'echo ""',
        'echo "Download complete!"',
        'echo "Files saved to: $OUTPUT_DIR"',
        'echo ""',
    ])

    # Write the script
    output_script = Path("scripts/download-trademe-docs.sh")
    with open(output_script, 'w', encoding='utf-8') as f:
        f.write('\n'.join(script_lines))

    # Make it executable
    os.chmod(output_script, 0o755)

    print(f"\nGenerated download script: {output_script}")
    print(f"Total endpoints to download: {len(endpoints)}")
    print(f"Categories: {len(by_category)}")
    print("\nRun with: ./scripts/download-trademe-docs.sh")

if __name__ == '__main__':
    main()
