IMAGE_NAME=lapierre/java-alpine
IMAGE_VERSION=8.252.09-r0

build:
	docker build -t $(IMAGE_NAME):$(IMAGE_VERSION) .
	#docker tag $(IMAGE_NAME):$(IMAGE_VERSION) $(IMAGE_NAME):latest

push:
	docker push $(IMAGE_NAME):$(IMAGE_VERSION)
	#docker push $(IMAGE_NAME):latest
