FROM golang:1.16 AS build-stage
WORKDIR /go/src/app
COPY . .
RUN go get -d -v ./...
RUN CGO_ENABLED=0 go build -o /go/src/appbin .

FROM scratch
COPY --from=build-stage /go/src/appbin /go/src/appbin
CMD ["/go/src/appbin"]
