#!/bin/bash

# Default to current directory if no argument is provided
SEARCH_DIR="${1:-.}"
OUTPUT_FILE="duplicates_report.csv"

# Check if directory exists
if [ ! -d "$SEARCH_DIR" ]; then
    echo "Error: Directory '$SEARCH_DIR' does not exist."
    exit 1
fi

echo "Scanning '$SEARCH_DIR' for duplicates..."
echo "Calculating SHA256 hashes (this may take a while)..."

# Create a temporary file for raw hashes
TMP_HASHES=$(mktemp)

# Find all files, calculate sha256sum, and save to temp file
# We use -type f to find files only
# We use -print0 and xargs -0 to handle filenames with spaces/newlines correctly
find "$SEARCH_DIR" -type f -print0 | xargs -0 sha256sum > "$TMP_HASHES"

echo "Processing duplicates..."

# Create/Overwrite output CSV with header
echo "Hash,FilePath" > "$OUTPUT_FILE"

# Logic to find duplicates:
# 1. Sort by hash (first column)
# 2. Use uniq -w 64 -D to print all lines that have duplicate hashes (checking first 64 chars for sha256)
# 3. Reformat to CSV
sort "$TMP_HASHES" | uniq -w 64 -D | while read -r line; do
    hash=$(echo "$line" | awk '{print $1}')
    # Extract filename (everything after the hash and the space/asterisk)
    # sha256sum output is: hash  filename (two spaces) or hash *filename (binary mode)
    # We'll use cut to get the rest of the line
    file=$(echo "$line" | cut -c 67-)
    
    # Escape double quotes in filename for CSV
    file="${file//\"/\"\"}"
    
    # Append to CSV
    echo "$hash,\"$file\"" >> "$OUTPUT_FILE"
done

# Clean up
rm "$TMP_HASHES"

echo "Done! Report saved to '$OUTPUT_FILE'"
echo "Found $(wc -l < "$OUTPUT_FILE" | awk '{print $1 - 1}') duplicate files."
