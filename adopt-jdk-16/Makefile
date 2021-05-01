IMAGE_NAME=lapierre/java-alpine
IMAGE_VERSION=16-adopt-jdk

build:
	docker build --pull -t $(IMAGE_NAME):$(IMAGE_VERSION) .

push:
	docker push $(IMAGE_NAME):$(IMAGE_VERSION)
