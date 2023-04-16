#build stage
FROM registry.cn-beijing.aliyuncs.com/system-dk1/golang:1.20 AS builder
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk add --no-cache git
WORKDIR /go/src/app
COPY . .
#RUN go get -d -v ./...
RUN go env -w GO111MODULE=on
RUN go env -w GOPROXY=https://goproxy.cn,direct
RUN go build -o /go/bin/app -v ./...

#final stage
FROM registry.cn-beijing.aliyuncs.com/system-dk1/alpine:latest
#RUN apk --no-cache add ca-certificates
COPY --from=builder /go/bin/app /app
ENTRYPOINT /app
LABEL Name=demo Version=0.0.1
EXPOSE 8080
#CMD ["infinite", "sleep"]
