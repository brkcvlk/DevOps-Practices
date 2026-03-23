# Dummy Systemd Service

Create a long-running systemd service that logs to a file.

## Setup

### 1. Copy the script and make it executable

```bash
sudo cp dummy.sh /usr/local/bin/dummy.sh
sudo chmod +x /usr/local/bin/dummy.sh
```

### 2. Copy the service file and reload systemd

```bash
sudo cp dummy.service /etc/systemd/system/dummy.service
sudo systemctl daemon-reload
```

### 3. Enable and start the service

```bash
sudo systemctl enable dummy
sudo systemctl start dummy
```

## Usage

```bash
sudo systemctl start dummy
sudo systemctl stop dummy
sudo systemctl enable dummy
sudo systemctl disable dummy
sudo systemctl status dummy

# Check the logs
sudo journalctl -u dummy -f
```


## Project

https://roadmap.sh/projects/dummy-systemd-service