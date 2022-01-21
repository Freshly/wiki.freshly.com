#!/bin/bash

# shellcheck disable=SC1091

set -o errexit
set -o nounset
set -o pipefail
# set -o xtrace # Uncomment this line for debugging purpose

python3 /opt/freshly/replace.py

exec /opt/bitnami/scripts/mediawiki/entrypoint.sh "$@"
