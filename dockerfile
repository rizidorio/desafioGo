FROM golang:alpine AS builder

RUN apk --no-cache add build-base

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-s -w" -o desafio .

RUN strip desafio

FROM scratch

COPY --from=builder /app/desafio /desafio

ENTRYPOINT ["/desafio"]
