



all:
	docker build --platform linux/amd64 -t gin-demo:v1.0.5 . 
	docker tag afd43bf88e3f registry.cn-beijing.aliyuncs.com/system-dk1/simple-http:v1.0.6
	docker push registry.cn-beijing.aliyuncs.com/system-dk1/simple-http:v1.0.6