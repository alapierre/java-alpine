IMAGE_NAME=lapierre/java-alpine
IMAGE_VERSION=11.0.8_p10-r0-a3.12

build:
	docker build -t $(IMAGE_NAME):$(IMAGE_VERSION) .
	docker tag $(IMAGE_NAME):$(IMAGE_VERSION) $(IMAGE_NAME):11

push:
	docker push $(IMAGE_NAME):$(IMAGE_VERSION)
	docker push $(IMAGE_NAME):11
