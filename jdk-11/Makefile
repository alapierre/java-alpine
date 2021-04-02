include ../.env

IMAGE_VERSION=11.0.9_p11-r1-a$(ALPINE_VERSION)

build:
	docker build -t $(IMAGE_NAME):$(IMAGE_VERSION) .
	docker tag $(IMAGE_NAME):$(IMAGE_VERSION) $(IMAGE_NAME):11

push:
	docker push $(IMAGE_NAME):$(IMAGE_VERSION)
	docker push $(IMAGE_NAME):11

multiarch:
	docker buildx build --push --pull --platform=linux/arm64/v8,linux/amd64 -t $(IMAGE_NAME):11 .
	docker pull $(IMAGE_NAME):11
	docker tag $(IMAGE_NAME):11 $(IMAGE_NAME):$(IMAGE_VERSION)
	docker push $(IMAGE_NAME):$(IMAGE_VERSION)
