#!/bin/bash -e

# Pull repo changes
git pull

# TODO: Make these dynamic
RELEASE_NUMBER="1.0.0"
DEPLOYMENT_TARGET="production"

PROJECT_DIR=$(pwd)
TEMP_ZPK_DIR=$PROJECT_DIR+"/zpk"
APP_NAME="DeploymentDemo"
APP_BASE_URI="http://DeploymentDemo:10080"
ZPK_NAME=$APP_NAME+"-"+$RELEASE_NUMBER+".zpk"

# Make temporary directory for zpk
mkdir $PROJECT_DIR+"/zpk"

# Install Composer dependencies
composer install --optimize-autoloader --no-dev

# Package the application for deployment
php-cli zs-client-ibm-i packZpk --folder=$PROJECT_DIR --destination=$TEMP_ZPK_DIR --version=$RELEASE_NUMBER --name=$ZPK_NAME

# Verify the zpk format
php-cli zs-client-ibm-i verifyZpk --from=$TEMP_ZPK_DIR+"/"+$ZPK_NAME

# Install the application
php-cli zs-client-ibm-i installApp --zpk=$TEMP_ZPK_DIR+"/"+$ZPK_NAME --target=$DEPLOYMENT_TARGET --baseUri=$APP_BASE_URI

# Revert to composer install with dev dependencies
composer install

# Remove temporary zpk directory
rm -R $TEMP_ZPK_DIR
