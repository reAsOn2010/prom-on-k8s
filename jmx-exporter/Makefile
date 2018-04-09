all: push

IMAGE_NAME=${IMAGE_BASE_URL}/jmx-exporter

build:
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .

push: build
	docker push $(IMAGE_NAME):$(IMAGE_TAG)
