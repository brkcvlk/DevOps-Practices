# Simple Monitoring Dashboard

Setting up a basic monitoring dashboard using Netdata on AWS EC2.

## Prerequisites

- AWS EC2 instance
- SSH access configured
- Port 19999 open in Security Group

## Setup

### 1. Install Netdata

```bash
bash setup.sh
```

Or manually:

```bash
curl https://get.netdata.cloud/kickstart.sh > /tmp/netdata-kickstart.sh && sh /tmp/netdata-kickstart.sh
sudo systemctl start netdata
sudo systemctl enable netdata
```

### 2. Access the Dashboard

```
http://<server-ip>:19999
```

### 3. Configure CPU Alert

```bash
sudo nano /etc/netdata/health.d/cpu.conf
```

Add the following:

```
alarm: high_cpu
on: system.cpu
lookup: average -1m unaligned of user,system,softirq,irq,iowait
units: %
every: 1m
warn: $this > 80
crit: $this > 95
info: CPU utilization
```

```bash
sudo systemctl restart netdata
```

## Scripts

> Note: Scripts should be created on the server using `nano` or copied with `scp`.

- `setup.sh` -> Installs and starts Netdata
- `test_dashboard.sh` -> Puts CPU, memory and disk load on the system to test the dashboard
- `cleanup.sh` -> Removes Netdata and all related files

### Copy scripts to server

```bash
scp -i ~/.ssh/<key> setup.sh ec2-user@<server-ip>:~/
scp -i ~/.ssh/<key> test_dashboard.sh ec2-user@<server-ip>:~/
scp -i ~/.ssh/<key> cleanup.sh ec2-user@<server-ip>:~/
```

### Run scripts on server

```bash
ssh <alias>
bash setup.sh
bash test_dashboard.sh
bash cleanup.sh
```

## Project

https://roadmap.sh/projects/simple-monitoring-dashboard