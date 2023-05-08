REGISTRY=cloud.canister.io:5000/ivanmartovytskyi
APP=$(shell basename $(shell git remote get-url origin))
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
TARGETARCH=amd64
TARGET_FILE=telebot
GOOS=linux

linux: set_linux_env build
windows: set_windows_env build
darwin: set_macOs_env build

linux_image: set_linux_env image
windows_image: set_windows_env image
darwin_image: set_macOs_env image

build: format get
	CGO_ENABLED=0 GOARCH=${TARGETARCH} GOOS=${GOOS} go build -o ${TARGET_FILE} -v -ldflags "-X '${REGISTRY}/telebot/cmd.appVersion=${VERSION}'"

format:
	gofmt -s -w ./

lint:
	golint

test:
	go test -v

get:
	go get

set_linux_env:
	$(eval GOOS=linux)

set_windows_env:
	$(eval GOOS=windows)

set_macOs_env:
	$(eval GOOS=darwin)

image:
	docker build . -t ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH} --build-arg TARGETARCH=${TARGETARCH} --build-arg TARGETSYSTEM=${GOOS}

push:
	docker push ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}

clean:
	docker rmi ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}