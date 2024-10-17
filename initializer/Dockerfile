
FROM alpine:latest

ENV DIR_PATH=/script

RUN apk update && apk add --no-cache curl openssl

RUN mkdir -p $DIR_PATH

RUN curl -o $DIR_PATH/init.sh https://raw.githubusercontent.com/gjan-dix/eth-k8s-devnet/main/execution/genesis.json

ENTRYPOINT ["sh", "-c", "curl http://example.com/init"]
