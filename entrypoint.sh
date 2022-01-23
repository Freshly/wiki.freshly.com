#!/bin/bash

# shellcheck disable=SC1091

set -o errexit
set -o nounset
set -o pipefail
# set -o xtrace # Uncomment this line for debugging purpose

echo "creating settings..."
python3 /opt/freshly/replace.py

rm -rf /opt/bitnami/mediawiki/extensions
ln -s /bitnami/mediawiki/extensions /opt/bitnami/mediawiki/extensions

rm -rf /opt/bitnami/mediawiki/skins
ln -s /bitnami/mediawiki/skins /opt/bitnami/mediawiki/skins

ln -s /bitnami/mediawiki/LocalSettings.php /opt/bitnami/mediawiki/LocalSettings.php

cd /opt/bitnami/mediawiki && composer update
cd /opt/bitnami/mediawiki && php maintenance/update.php --quick

# exec /opt/bitnami/scripts/mediawiki/entrypoint.sh "$@"
exec "$@"
