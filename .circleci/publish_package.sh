#!/bin/sh
set -ex

# Determine the version from the tag; remove the leading v "v3.3.0" -> "3.3.0"
# HOST="https://wework.jfrog.io/artifactory/api/composer/php-local"
HOST="https://rafapaz.jfrog.io/artifactory/composer-php-local"
VERSION=$(echo "${CIRCLE_TAG}" | sed 's/^v//')
VERSION=1.0.0
echo "${VERSION}"
FILE_NAME="welkio-error-$VERSION.zip"
git archive -o "$FILE_NAME" HEAD

# curl al rest api
curl -u "$ARTIFACTORY_USER:$ARTIFACTORY_APIKEY" -X PUT "$HOST/circleci/welkio-error/$FILE_NAME" -T "$FILE_NAME"
