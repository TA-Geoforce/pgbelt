FROM python:3.11-slim
COPY ./ /opt/pgbelt
WORKDIR /opt/pgbelt

RUN set -e \
    && python -m pip install --upgrade pip \
    && pip install poetry poetry-dynamic-versioning \
    && poetry install

RUN set -e \
    && apt-get -y update \
    && apt-get -y install postgresql-client

RUN pip install -e .

ENTRYPOINT ["sh", "-c", "cd /home && bash"]
