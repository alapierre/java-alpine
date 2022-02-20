include ../.env
IMAGE_VERSION=$(JAVA_8_VERSION)-a$(ALPINE_VERSION)$(IMAGE_POSTFIX)

build:
	docker build --pull --build-arg JAVA_VERSION=$(JAVA_8_VERSION) -t $(IMAGE_NAME):$(IMAGE_VERSION) .
	docker tag $(IMAGE_NAME):$(IMAGE_VERSION) $(IMAGE_NAME):latest
	docker tag $(IMAGE_NAME):$(IMAGE_VERSION) $(IMAGE_NAME):8

push:
	docker push $(IMAGE_NAME):$(IMAGE_VERSION)
	docker push $(IMAGE_NAME):latest

multiarch:
	docker buildx build --build-arg JAVA_VERSION=$(JAVA_8_VERSION) --push --pull --platform=linux/arm/v7,linux/arm64/v8,linux/amd64 -t $(IMAGE_NAME):8 .
	docker pull $(IMAGE_NAME):8
	docker tag $(IMAGE_NAME):8 $(IMAGE_NAME):latest
	docker push $(IMAGE_NAME):latest
	docker tag $(IMAGE_NAME):8 $(IMAGE_NAME):$(IMAGE_VERSION)
	docker push $(IMAGE_NAME):$(IMAGE_VERSION)

github:
	docker buildx build --build-arg JAVA_VERSION=$(JAVA_8_VERSION) --platform $(DOCKER_PLATFORMS) \
 		--tag "$(IMAGE_NAME):8" --tag "$(IMAGE_NAME):$(IMAGE_VERSION)" \
 		--output "type=image,push=true" .
