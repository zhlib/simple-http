FROM golang:1.18.3-alpine3.16

RUN echo "----------------- Gin Web Enterpise Wx building -----------------"

# set environments
# enable go modules
ENV GO111MODULE=on
# set up an agent to speed up downloading resources
ENV GOPROXY=https://goproxy.cn,direct
# set app home dir
ENV APP_HOME /app/gin-web

RUN mkdir -p $APP_HOME

WORKDIR $APP_HOME

# copy go.mod / go.sum to download dependent files
COPY go.mod go.sum ./
RUN go mod tidy

# copy source files
COPY . .

# save current git version
# RUN chmod +x version.sh && ./version.sh

RUN go build -o gin-web .

# CMD ["sleep","infinity"]
EXPOSE 8080
ENTRYPOINT ["./gin-web"]
