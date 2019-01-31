IMAGE_NAME=mmmk


install: get-deps test build


get-deps:
	go get ./...

build:
	go build -v -o $(IMAGE_NAME)

build-linux:
	env CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -v -o $(IMAGE_NAME).linux

test:
	go test -v -coverprofile=cover.out ./...

cover:
	go tool cover -html=cover.out
