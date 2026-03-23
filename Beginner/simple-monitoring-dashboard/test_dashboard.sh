#!/bin/bash

# Puts load on the system to test the Netdata dashboard.

echo "Starting CPU load for 60 seconds"
for i in $(seq 1 $(nproc)); do
  dd if=/dev/zero of=/dev/null &
done

sleep 60
kill $(jobs -p)

echo "Starting memory load for 30 seconds"
dd if=/dev/zero of=/tmp/testfile bs=1M count=512 2>/dev/null
sleep 30
rm -f /tmp/testfile

echo "Starting disk I/O load for 30 seconds"
dd if=/dev/zero of=/tmp/disktest bs=1M count=1024 2>/dev/null
sleep 30
rm -f /tmp/disktest

echo "Load test complete. Check the Netdata dashboard."