docker login

docker buildx build --no-cache --platform linux/amd64,linux/arm64 --push -t agj017/openssl-curl:latest .
# docker buildx build --no-cache --platform linux/amd64,linux/arm64 -t agj017/openssl-curl:latest --push .

docker push agj017/openssl-curl:latest

