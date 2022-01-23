set dotenv-load

test:
    ./replace.py

decode:
    echo $REPLACE_ENV | base64 -d > env.json

encode:
    echo REPLACE_ENV=$(cat env.json | base64 -w0) > .env
