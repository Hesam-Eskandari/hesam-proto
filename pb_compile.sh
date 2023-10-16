#!/bin/sh

go install github.com/golang/protobuf/proto@latest 2>/dev/null;
go install github.com/golang/protobuf/protoc-gen-go@latest 2>/dev/null;
go install google.golang.org/grpc@latest 2>/dev/null;

protoc -I=. --go_out=plugins=grpc:. $(find src -type f -name "*.proto");
protoc -I=. --python_out=. $(find src -type f -name "*.proto");

for filepath in $(find src -type f -name "*.proto")
do
  protoc -I=. --csharp_out=$(dirname "${filepath}") "$filepath";
done

