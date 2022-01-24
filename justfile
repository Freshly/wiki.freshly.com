set dotenv-load

test:
    ./replace.py

decode:
    echo $REPLACE_ENV | base64 -d > env.json

encode:
    echo REPLACE_ENV=$(cat env.json | base64 -w0) > .env

decode-conf:
    kubectl get configmap -o json -n wiki $CONF | jq -r .data.REPLACE_ENV | base64 -d
