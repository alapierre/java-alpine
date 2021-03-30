IMAGE_NAME=lapierre/java-alpine
IMAGE_VERSION=15.0.1_p9-r0-a3.12.3

build:
	docker build --pull -t $(IMAGE_NAME):$(IMAGE_VERSION) .
	docker tag $(IMAGE_NAME):$(IMAGE_VERSION) $(IMAGE_NAME):15

push:
	docker push $(IMAGE_NAME):$(IMAGE_VERSION)
	docker push $(IMAGE_NAME):15
