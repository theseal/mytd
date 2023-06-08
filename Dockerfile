FROM python:3.10.5-bullseye

RUN python3 -m pip install poetry

RUN apt-get update && \
    apt-get install --no-install-recommends -y ffmpeg && \
    rm -rf /var/lib/apt/lists/*

COPY poetry.lock pyproject.toml /

RUN poetry config virtualenvs.create false \
  && poetry install --no-interaction --no-ansi

COPY downloader /downloader
CMD ["/downloader"]
