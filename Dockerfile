FROM python:3.13-trixie

COPY --from=ghcr.io/astral-sh/uv:0.8 /uv /uvx /bin/

RUN apt-get update && \
    apt-get install --no-install-recommends -y ffmpeg && \
    rm -rf /var/lib/apt/lists/*

ADD . /app
WORKDIR /app

RUN uv sync --frozen

COPY downloader /downloader
CMD ["/downloader"]

CMD ["uv", "run", "/downloader"]
