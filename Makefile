IMAGE_NAME := akkadeeemikk/cuda_base
DOCKER_TAG := latest
PURE_TAG := pure
CONTAINER_NAME := cuda_base

build:
	docker build -f docker/base/Dockerfile -t $(IMAGE_NAME) .


run_docker_bash:
	docker run -it --rm \
		--ipc=host \
  		--network=host \
  		--gpus=all \
  		-v ./:/project/ \
  		--name $(CONTAINER_NAME) \
  		$(IMAGE_NAME) bash

run_compose:
	docker compose up -d --build

run_docker_trt_bash:
	docker run -it \
		--ipc=host \
  		--network=host \
  		--gpus=all \
  		-v ./:/detector/ \
  		--name $(CONTAINER_NAME)_$(TRT_TAG) \
  		$(IMAGE_NAME)_$(TRT_TAG) bash

load_dataset:
	mkdir ../datasets && \
	wget https://github.com/zylo117/Yet-Another-EfficientDet-Pytorch/releases/download/1.1/dataset_birdview_vehicles.zip && \
	unzip -d ../datasets/ /detector/tutorial/dataset_birdview_vehicles.zip

load_weights:
	mkdir weights && \
	wget https://github.com/zylo117/Yet-Another-EfficientDet-Pytorch/releases/download/1.0/efficientdet-d0.pth -O weights/efficientdet-d0.pth


stop:
	docker stop $(CONTAINER_NAME)

jupyter:
	jupyter lab --allow-root --ip=0.0.0.0 --port=8888 --no-browser --NotebookApp.token=project