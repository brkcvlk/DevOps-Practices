# Log Archive Tool

Build a tool to archive logs from the CLI with the date and time.

## Usage

```bash
bash log-archive.sh <log-directory>
```

Example:
```bash
bash log-archive.sh ./test_logs
```

## Output

- Creates a `logs_archive/` directory next to the script
- Saves compressed archive as `logs_archive_YYYYMMDD_HHMMSS.tar.gz`
- Logs each archive operation with date and time to `logs_archive/archive_log.txt`

## Project

https://roadmap.sh/projects/log-archive-tool