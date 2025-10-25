FROM golang:1.18-alpine AS builder

WORKDIR /app

COPY hello.go .

RUN go build -ldflags="-s -w" -o hello hello.go

FROM scratch

COPY --from=builder /app/hello .

ENTRYPOINT ["/hello"]