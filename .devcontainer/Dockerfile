FROM mcr.microsoft.com/devcontainers/typescript-node:24-bookworm

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        fd-find \
        git \
        jq \
        ripgrep \
        sqlite3 \
    && ln -s /usr/bin/fdfind /usr/local/bin/fd \
    && npm install -g --ignore-scripts @earendil-works/pi-coding-agent@0.85.0 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
