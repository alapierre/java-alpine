IMAGE_NAME=lapierre/java-alpine
IMAGE_VERSION=8.282.08-r0-a3.12.3

build:
	docker build --pull -t $(IMAGE_NAME):$(IMAGE_VERSION) .
	docker tag $(IMAGE_NAME):$(IMAGE_VERSION) $(IMAGE_NAME):latest

push:
	docker push $(IMAGE_NAME):$(IMAGE_VERSION)
	docker push $(IMAGE_NAME):latest

multiarch:
	docker buildx build --push --pull --platform=linux/arm/v7,linux/arm64/v8,linux/amd64 -t $(IMAGE_NAME):8 .
	docker pull $(IMAGE_NAME):8
