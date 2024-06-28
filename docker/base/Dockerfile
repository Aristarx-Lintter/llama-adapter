FROM pytorch/pytorch:2.1.0-cuda12.1-cudnn8-devel

ENV FORCE_CUDA="1"
RUN apt-get update && apt-get install libsm6 libxext6 libgl1-mesa-glx -y

ENV TZ=Europe/Minsk
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone