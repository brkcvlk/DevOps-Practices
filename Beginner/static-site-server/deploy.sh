#!/bin/bash

# Usage: bash deploy.sh

rsync -avz --delete mysite/ ec2-user@<server-ip>:/var/www/mysite/