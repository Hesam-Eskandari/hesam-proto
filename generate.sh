


docker container run --name protoc --rm \
  -v "$(pwd)"/src:/go/src \
  -it hesampriv/sso-proto-manager:0.1.35;

#go mod tidy;
#go mod vendor;
