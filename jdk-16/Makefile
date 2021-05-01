IMAGE_NAME=lapierre/java-alpine
IMAGE_VERSION=16.0.0_p36-r1-a$(ALPINE_VERSION)

build:
	docker build --pull -t $(IMAGE_NAME):$(IMAGE_VERSION) .
	docker tag $(IMAGE_NAME):$(IMAGE_VERSION) $(IMAGE_NAME):16

push:
	docker push $(IMAGE_NAME):$(IMAGE_VERSION)
	docker push $(IMAGE_NAME):16

multiarch:
	docker buildx build --push --pull --platform=linux/arm64/v8,linux/amd64 -t $(IMAGE_NAME):16 .
	docker pull $(IMAGE_NAME):16
	docker tag $(IMAGE_NAME):16 $(IMAGE_NAME):$(IMAGE_VERSION)
	docker push $(IMAGE_NAME):$(IMAGE_VERSION)
