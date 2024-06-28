FROM akkadeeemikk/cuda_base:latest

WORKDIR /project

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY setup.py setup.py
COPY pyproject.toml pyproject.toml
RUN pip install -e .

RUN pip install jupyter