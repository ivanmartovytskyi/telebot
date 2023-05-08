APP=$(shell basename $(shell git remote get-url origin))
REGISTRY=ivanmartovytskyi
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
TARGETOS=linux
TARGET_FILE=telebot
ARCHITECTURE=$(shell dpkg --print-architecture)
TARGETARCH=amd4

format:
	gofmt -s -w ./

lint:
	golint

test:
	go test -v

get:
	go get

build: format get
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -o telebot -v -ldflags "-X 'github.com/ivanmartovytskyi/telebot/cmd.appVersion=${VERSION}'"

image:
	docker build . -t ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}

push:
	docker push . ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}

clean:
	rm -rf telebot