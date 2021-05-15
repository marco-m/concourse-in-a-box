#! /bin/sh

set -e

# We expect the caller to set these environment variables:
: "${VAULT_ADDR?Need to set this environment variable}"
: "${VAULT_DEV_ROOT_TOKEN_ID?Need to set this environment variable}"
: "${MINIO_ADDR?Need to set this environment variable}"
: "${MINIO_REGION_NAME?Need to set this environment variable}"
: "${MINIO_ACCESS_KEY?Need to set this environment variable}"
: "${MINIO_SECRET_KEY?Need to set this environment variable}"

echo
echo "***** Logging in to Vault"
vault login token="$VAULT_DEV_ROOT_TOKEN_ID"

echo
echo "***** Checking if the /concourse path is already enabled"
if vault secrets list | grep concourse; then
    echo "***** already enabled"
else
    echo "***** to be enabled"
    echo "***** Enabling the /concourse path"
    vault secrets enable -path=/concourse kv
fi

echo
echo "***** Adding secrets"
vault kv put /concourse/main/s3-endpoint   value="$MINIO_ADDR"
vault kv put /concourse/main/s3-region     value="$MINIO_REGION_NAME"
vault kv put /concourse/main/s3-access-key value="$MINIO_ACCESS_KEY"
vault kv put /concourse/main/s3-secret-key value="$MINIO_SECRET_KEY"
