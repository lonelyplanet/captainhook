FROM golang:1.6.0-alpine

RUN apk add --no-cache git jq

RUN mkdir -p /go/src/app
WORKDIR /go/src/app

RUN go get github.com/gorilla/mux

VOLUME /config
COPY . /go/src/app
RUN go build .
CMD ["/go/src/app/app", "-listen-addr", "0.0.0.0:8080", "-configdir", "/config"]
