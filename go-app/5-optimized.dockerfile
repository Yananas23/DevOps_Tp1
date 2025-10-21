FROM golang:1.21-alpine AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN go build -ldflags="-s -w" -o server .

FROM alpine:3.20

RUN adduser -D user
USER user

COPY --from=builder /app/server .

EXPOSE 8080

CMD ["./server"]
