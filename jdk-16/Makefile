include ../.env

IMAGE_NAME=lapierre/java-alpine
IMAGE_VERSION=$(JAVA_16_VERSION)-a$(ALPINE_VERSION)$(IMAGE_POSTFIX)

build:
	docker build --no-cache --pull -t $(IMAGE_NAME):$(IMAGE_VERSION) .
	docker tag $(IMAGE_NAME):$(IMAGE_VERSION) $(IMAGE_NAME):16

push:
	docker push $(IMAGE_NAME):$(IMAGE_VERSION)
	docker push $(IMAGE_NAME):16

multiarch:
	docker buildx build --push --pull --platform=$(DOCKER_PLATFORMS) -t $(IMAGE_NAME):16 .
	docker pull $(IMAGE_NAME):16
	docker tag $(IMAGE_NAME):16 $(IMAGE_NAME):$(IMAGE_VERSION)
	docker push $(IMAGE_NAME):$(IMAGE_VERSION)

github:
	docker buildx build --platform $(DOCKER_PLATFORMS) \
 		--tag "$(IMAGE_NAME):16" --tag "$(IMAGE_NAME):$(IMAGE_VERSION)" \
 		--output "type=image,push=true" .
