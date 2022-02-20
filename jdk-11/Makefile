include ../.env

IMAGE_VERSION=$(JAVA_11_VERSION)-a$(ALPINE_VERSION)$(IMAGE_POSTFIX)

build:
	docker build --pull -t $(IMAGE_NAME):$(IMAGE_VERSION) .
	docker tag $(IMAGE_NAME):$(IMAGE_VERSION) $(IMAGE_NAME):11

push:
	docker push $(IMAGE_NAME):$(IMAGE_VERSION)
	docker push $(IMAGE_NAME):11

multiarch:
	docker buildx build --push --pull --platform=$(DOCKER_PLATFORMS) -t $(IMAGE_NAME):11 .
	docker pull $(IMAGE_NAME):11
	docker tag $(IMAGE_NAME):11 $(IMAGE_NAME):$(IMAGE_VERSION)
	docker push $(IMAGE_NAME):$(IMAGE_VERSION)

github:
	docker buildx build --platform $(DOCKER_PLATFORMS) \
 		--tag "$(IMAGE_NAME):11" --tag "$(IMAGE_NAME):$(IMAGE_VERSION)" \
 		--output "type=image,push=true" .
