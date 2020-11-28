IMAGE_NAME=lapierre/java-alpine
IMAGE_VERSION=15.0.1_p9-r0-a3.12.1

build:
	docker build -t $(IMAGE_NAME):$(IMAGE_VERSION) .
#	docker tag $(IMAGE_NAME):$(IMAGE_VERSION) $(IMAGE_NAME):latest
	docker tag $(IMAGE_NAME):$(IMAGE_VERSION) $(IMAGE_NAME):15

push:
	docker push $(IMAGE_NAME):$(IMAGE_VERSION)
#	docker push $(IMAGE_NAME):latest
	docker push $(IMAGE_NAME):15
