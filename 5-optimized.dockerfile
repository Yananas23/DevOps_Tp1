FROM golang:1.21-alpine AS builder

WORKDIR /app

COPY go-app/go.mod go-app/go.sum ./
RUN go mod download

COPY go-app/ .

RUN go build -o server .

EXPOSE 8080

FROM scratch

COPY --from=builder /app/server .

CMD ["./server"]
