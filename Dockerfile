FROM python:3.10.5-bullseye

RUN pip3 install poetry

COPY poetry.lock pyproject.toml /

RUN poetry config virtualenvs.create false \
  && poetry install --no-interaction --no-ansi

COPY downloader /downloader
CMD ["/usr/local/bin/poetry","run","/downloader"]
