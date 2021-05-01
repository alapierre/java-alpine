IMAGE_NAME=lapierre/java-alpine
IMAGE_VERSION=16-adopt-jdk

build:
	docker build --pull -t $(IMAGE_NAME):$(IMAGE_VERSION) .
	docker tag $(IMAGE_NAME):$(IMAGE_VERSION) $(IMAGE_NAME):16

push:
	docker push $(IMAGE_NAME):$(IMAGE_VERSION)
	docker push $(IMAGE_NAME):16
