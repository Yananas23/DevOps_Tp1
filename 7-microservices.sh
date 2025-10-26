#!/bin/bash

cat <<EOF > docker-compose.yml
services:
  api:
    build: ./microservices-app/api
    ports:
      - "4000:4000"
    depends_on:
      - postgres
      - redis
    networks:
      - microservices

  worker:
    build: ./microservices-app/worker
    depends_on:
      - redis
      - postgres
    networks:
      - microservices

  postgres:
    image: postgres:15
    environment:
      POSTGRES_USER: user
      POSTGRES_PASSWORD: password
      POSTGRES_DB: appdb
    volumes:
      - postgres_data:/var/lib/postgresql/data
    networks:
      - microservices

  redis:
    image: redis:7
    networks:
      - microservices

volumes:
  postgres_data:

networks:
  microservices:
EOF
