



all:
	docker build --platform linux/amd64 -t gin-demo:v1.0.3 . 
	docker tag 625e5cc6d895 registry.cn-beijing.aliyuncs.com/system-dk1/simple-http:v1.0.3
	docker push registry.cn-beijing.aliyuncs.com/system-dk1/simple-http:v1.0.3