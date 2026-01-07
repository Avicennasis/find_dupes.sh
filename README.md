# Find Dupes

A simple, robust shell script for Cygwin on Windows 10 to recursively scan directories, calculate SHA256 hashes, and identify duplicate files.

## Features

- **Recursive Scanning**: Traverses all subdirectories.
- **SHA256 Hashing**: Uses secure SHA256 hashes to identify duplicates.
- **CSV Report**: Generates a `duplicates_report.csv` containing the hash, file path, and size of all duplicates found.
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
  - `du`

## Installation

1.  Clone this repository or download `find_dupes.sh`.
2.  Make the script executable:
    ```bash
    chmod +x find_dupes.sh
    ```

## Usage

Run the script from your Cygwin terminal.
```bash
./find_dupes.sh [OPTIONS] [DIRECTORY]
```

### Options

| Flag | Description |
| :--- | :--- |
| `-h`, `--help` | Show help message and exit. |
| `-v`, `--verbose` | Enable verbose output (shows progress and details). |
| `-o`, `--output FILE` | Specify output file (default: `duplicates_report.csv`). |

### Arguments

- `DIRECTORY`: The directory to scan. Defaults to the current directory if not specified.

### Examples

Scan the current directory:
```bash
./find_dupes.sh
```

Scan a specific folder with verbose output:
```bash
./find_dupes.sh -v /cygdrive/c/Users/MyUser/Documents
```

Save report to a custom file:
```bash
./find_dupes.sh -o my_report.csv
```

## Output

The script creates a file named `duplicates_report.csv` in the current working directory.

**Format:**
```csv
Hash,FilePath,Size
<sha256_hash>,"<path_to_file_1>",<size>
<sha256_hash>,"<path_to_file_2>",<size>
...
```

## License

MIT License. See [LICENSE](LICENSE) for details.

## Credits

Created by Léon "Avic" Simmons.
