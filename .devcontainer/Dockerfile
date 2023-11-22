FROM elixir:1.15.7

ENV LANG="C.UTF-8"

RUN apt-get update && \
    apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        git \
        inotify-tools \
        sqlite3 && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get autoremove -y && \
    apt-get clean && \
	rm -rf /var/lib/apt/lists/*
