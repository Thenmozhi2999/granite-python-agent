FROM python:3.12-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN python -m pip install --upgrade pip
RUN python -m pip install \
    poetry \
    pytest \
    ruff \
    black \
    pre-commit

WORKDIR /workspace
COPY build.sh /workspace/build.sh
RUN chmod +x /workspace/build.sh

ENTRYPOINT ["/workspace/build.sh"]