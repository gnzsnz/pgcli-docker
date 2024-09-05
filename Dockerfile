FROM python:3-slim
ARG IMAGE_VERSION
ARG DEBIAN_FRONTEND=noninteractive

COPY run-pgcli.sh /bin/run-pgcli.sh
COPY requirements.txt /requirements.txt

RUN apt-get -y update && \
	apt-get -y install --no-install-recommends less  && \
	apt-get clean && rm -rf /var/lib/apt/lists/* && \
	pip install --no-cache-dir -r requirements.txt

ENV PAGER=less
ENTRYPOINT ["run-pgcli.sh"]

LABEL org.opencontainers.image.source=https://github.com/gnzsnz/pgcli-docker
LABEL org.opencontainers.image.url=https://github.com/gnzsnz/pgcli-docker/pkgs/container/pgcli
LABEL org.opencontainers.image.description="A dockerized pgcli."
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.version=${IMAGE_VERSION}
