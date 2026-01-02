# Find Dupes

A simple, robust shell script for Cygwin on Windows 10 to recursively scan directories, calculate SHA256 hashes, and identify duplicate files.

## Features

- **Recursive Scanning**: Traverses all subdirectories.
- **SHA256 Hashing**: Uses secure SHA256 hashes to identify duplicates.
- **CSV Report**: Generates a `duplicates_report.csv` containing the hash and file path of all duplicates found.
- **Robustness**: Handles filenames with spaces and special characters correctly.

## Prerequisites

- **Cygwin**: Ensure you have Cygwin installed on your Windows machine.
- **Dependencies**: The script relies on standard tools usually available in Cygwin:
  - `bash`
  - `find`
  - `sha256sum`
  - `sort`
  - `uniq`
  - `awk`
  - `cut`

## Installation

1.  Clone this repository or download `find_dupes.sh`.
2.  Make the script executable:
    ```bash
    chmod +x find_dupes.sh
    ```

## Usage

Run the script from your Cygwin terminal. You can provide a directory to scan as an argument. If no argument is provided, it scans the current directory.

```bash
./find_dupes.sh [directory_to_scan]
```

### Examples

Scan the current directory:
```bash
./find_dupes.sh
```

Scan a specific folder:
```bash
./find_dupes.sh /cygdrive/c/Users/MyUser/Documents
```

## Output

The script creates a file named `duplicates_report.csv` in the current working directory.

**Format:**
```csv
Hash,FilePath
<sha256_hash>,"<path_to_file_1>"
<sha256_hash>,"<path_to_file_2>"
...
```

## License

MIT License. See [LICENSE](LICENSE) for details.

## Credits

Created by Léon "Avic" Simmons.
