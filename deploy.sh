#!/bin/bash -e

# Pull repo changes
git pull

# Build log file name
NOW=$(date +"%Y%m%d%H%M")
FILE="/www/path/to/logs/deploy-$NOW.log"

# Execute Phing deploy
./vendor/bin/phing -f ./phing-deploy.xml > ${FILE}
