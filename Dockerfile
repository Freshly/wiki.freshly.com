FROM bitnami/mediawiki:latest

COPY mediawiki/extensions /bitnami/mediawiki/extensions
COPY mediawiki/skins /bitnami/mediawiki/skins

COPY LocalSettings.template.php /opt/freshly/LocalSettings.template.php
COPY replace.py /opt/freshly/replace.py
COPY entrypoint.sh /opt/freshly/entrypoint.sh

USER root

RUN chmod +x /opt/freshly/entrypoint.sh

RUN apt-get update
RUN apt-get install -y python3

# TODO: switch back to unprivileged user
# USER 1001

ENTRYPOINT [ "/opt/freshly/entrypoint.sh" ]

CMD [ "/opt/bitnami/scripts/apache/run.sh" ]
