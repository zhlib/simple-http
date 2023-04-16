FROM registry.cn-beijing.aliyuncs.com/system-dk1/golang:1.20 AS builder


RUN echo "----------------- Gin Web Enterpise Wx building -----------------"
RUN mkdir -p /app/gin-web
WORKDIR /app/gin-web
COPY go.mod go.sum ./
RUN go mod tidy
COPY . .
RUN go build -o gin-web .
EXPOSE 8080
ENTRYPOINT  /app/gin-web/gin-web
