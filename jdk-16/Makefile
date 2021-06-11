include ../.env

IMAGE_NAME=lapierre/java-alpine
IMAGE_VERSION=$(JAVA_16_VERSION)-a$(ALPINE_VERSION)

build:
	docker build --no-cache --pull -t $(IMAGE_NAME):$(IMAGE_VERSION) .
	#docker tag $(IMAGE_NAME):$(IMAGE_VERSION) $(IMAGE_NAME):16

push:
	docker push $(IMAGE_NAME):$(IMAGE_VERSION)
#	docker push $(IMAGE_NAME):16

multiarch:
	docker buildx build --push --pull --platform=linux/arm64/v8,linux/amd64 -t $(IMAGE_NAME):16 .
	docker pull $(IMAGE_NAME):16
	docker tag $(IMAGE_NAME):16 $(IMAGE_NAME):$(IMAGE_VERSION)
	docker push $(IMAGE_NAME):$(IMAGE_VERSION)
