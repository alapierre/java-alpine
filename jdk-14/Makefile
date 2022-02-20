include ../.env

IMAGE_VERSION=$(JAVA_14_VERSION)-a$(ALPINE_VERSION)$(IMAGE_POSTFIX)

build:
	docker build -t $(IMAGE_NAME):$(IMAGE_VERSION) .
	docker tag $(IMAGE_NAME):$(IMAGE_VERSION) $(IMAGE_NAME):14

push:
	docker push $(IMAGE_NAME):$(IMAGE_VERSION)
	docker push $(IMAGE_NAME):14

multiarch:
	docker buildx build --push --pull --platform=$(DOCKER_PLATFORMS) -t $(IMAGE_NAME):14 .
	docker pull $(IMAGE_NAME):14
	docker tag $(IMAGE_NAME):14 $(IMAGE_NAME):$(IMAGE_VERSION)
	docker push $(IMAGE_NAME):$(IMAGE_VERSION)

github:
	docker buildx build --platform $(DOCKER_PLATFORMS) \
 		--tag "$(IMAGE_NAME):14" --tag "$(IMAGE_NAME):$(IMAGE_VERSION)" \
 		--output "type=image,push=true" .
