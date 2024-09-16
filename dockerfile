FROM golang:alpine AS builder

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o desafio .

FROM scratch

COPY --from=builder /app/desafio /desafio

ENTRYPOINT ["/desafio"]
