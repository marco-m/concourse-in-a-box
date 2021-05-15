#! /bin/sh

set -e

# We expect the caller to set these environment variables:
: "${MINIO_ADDR?Need to set this environment variable}"
: "${MINIO_ACCESS_KEY?Need to set this environment variable}"
: "${MINIO_SECRET_KEY?Need to set this environment variable}"

echo
echo "***** Logging in to Minio"
mc alias set concourse-minio "$MINIO_ADDR" "$MINIO_ACCESS_KEY" "$MINIO_SECRET_KEY"

echo
echo "***** Creating the bucket: /concourse"
mc mb --ignore-existing concourse-minio/concourse
