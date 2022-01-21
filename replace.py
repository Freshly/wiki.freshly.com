#!/usr/bin/env python3

import json
import os
import base64
import logging

replace_env_encoded = os.getenv("REPLACE_ENV")

if not replace_env_encoded:
    logging.error("REPLACE_ENV not set")
    exit(1)

replace_env_str = base64.b64decode(replace_env_encoded, validate=True)
replace_env = json.loads(replace_env_str)

template = ""
with open('/opt/freshly/LocalSettings.template.php', encoding='utf8') as f:
    template = f.read()

for key in replace_env:
    value = replace_env[key]
    template = template.replace(key, value)

with open('/opt/bitnami/mediawiki/LocalSettings.php', mode='w', encoding='utf8') as f:
    f.write(template)
