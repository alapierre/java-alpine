include ../.env

IMAGE_VERSION=14.0.2_p12-r1-a$(ALPINE_VERSION)

build:
	docker build -t $(IMAGE_NAME):$(IMAGE_VERSION) .
	docker tag $(IMAGE_NAME):$(IMAGE_VERSION) $(IMAGE_NAME):14

push:
	docker push $(IMAGE_NAME):$(IMAGE_VERSION)
	docker push $(IMAGE_NAME):14

multiarch:
	docker buildx build --push --pull --platform=linux/arm64/v8,linux/amd64 -t $(IMAGE_NAME):14 .
	docker pull $(IMAGE_NAME):14
	docker tag $(IMAGE_NAME):14 $(IMAGE_NAME):$(IMAGE_VERSION)
	docker push $(IMAGE_NAME):$(IMAGE_VERSION)
