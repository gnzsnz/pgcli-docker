FROM python:3-slim
MAINTAINER Dennis Coldwell <dennis.coldwell@gmail.com>
RUN apt-get -y update && DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends less  && \
	apt-get clean && rm -rf /var/lib/apt/lists/* && \
	pip install --no-cache-dir psycopg[binary] pgcli
ADD run-pgcli.sh /bin/run-pgcli.sh
ENV PAGER=less
ENTRYPOINT ["run-pgcli.sh"]

