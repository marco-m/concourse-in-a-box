#! /bin/sh

set -e

# We expect the caller to set these environment variables:
: "${CONCOURSE_ADDR?Need to set this environment variable}"

# FIXME This should be replaced by a more robust healthcheck, see
# https://docs.docker.com/compose/compose-file/compose-file-v3/#healthcheck
# https://docs.docker.com/engine/reference/builder/#healthcheck
echo
echo "***** Sleeping a few seconds to allow Concourse to startup"
sleep 5

echo
echo "***** Downloading fly from the local Concourse"
curl -o fly "http://$CONCOURSE_ADDR/api/v1/cli?arch=amd64&platform=linux"
chmod +x ./fly

echo
echo "***** Logging in to Concourse"
./fly -t main login --username=main --password=main \
  --concourse-url=http://$CONCOURSE_ADDR

echo "***** Creating team developers and setting specific roles for different users"
./fly -t main set-team --non-interactive --team-name=developers \
  --local-user=readonly --config=/scripts/roles.yml