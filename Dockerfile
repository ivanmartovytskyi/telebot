ARG TARGETARCH=amd64
ARG TARGETSYSTEM=linux

FROM quay.io/projectquay/golang:1.20 as builder
WORKDIR /go/src/app
COPY . .
RUN make TARGETARCH=$TARGETARCH $TARGETSYSTEM

FROM scratch
WORKDIR /
COPY --from=builder /go/src/app/telebot .
COPY --from=alpine:latest /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs
ENTRYPOINT [ "./telebot" ]
