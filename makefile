



all:
	docker build --platform linux/amd64 -t gin-demo:v1.0.5 . 
	docker tag 9c8b4ad2c1e4 registry.cn-beijing.aliyuncs.com/system-dk1/simple-http:v1.0.5
	docker push registry.cn-beijing.aliyuncs.com/system-dk1/simple-http:v1.0.5