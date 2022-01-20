FROM bitnami/mediawiki:latest

USER root

RUN apt-get update
RUN apt-get install -y python3

# TODO: switch back to unprivileged user
# USER 1001
