FROM golang:1.25 AS builder
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o /static-server


FROM alpine
COPY --from=builder /static-server /static-server
EXPOSE 8080
CMD ["/static-server"]
