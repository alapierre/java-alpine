include ../.env

IMAGE_VERSION=$(JAVA_15_VERSION)-a$(ALPINE_VERSION)$(IMAGE_POSTFIX)

build:
	docker build --pull -t $(IMAGE_NAME):$(IMAGE_VERSION) .
	docker tag $(IMAGE_NAME):$(IMAGE_VERSION) $(IMAGE_NAME):15

push:
	docker push $(IMAGE_NAME):$(IMAGE_VERSION)
	docker push $(IMAGE_NAME):15

# there is no arm/v7 Java package for Apline
multiarch:
	docker buildx build --push --pull --platform=$(DOCKER_PLATFORMS) -t $(IMAGE_NAME):15 .
	docker pull $(IMAGE_NAME):15
	docker tag $(IMAGE_NAME):15 $(IMAGE_NAME):$(IMAGE_VERSION)
	docker push $(IMAGE_NAME):$(IMAGE_VERSION)

github:
	docker buildx build --platform $(DOCKER_PLATFORMS) \
 		--tag "$(IMAGE_NAME):15" --tag "$(IMAGE_NAME):$(IMAGE_VERSION)" \
 		--output "type=image,push=true" .
