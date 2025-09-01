FROM golang:1.25 AS builder
COPY . .
RUN go build -o /static-server

FROM alpine
COPY --from=builder /static-server /static-server
EXPOSE 8080
CMD ["/static-server"]
