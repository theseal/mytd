FROM python:3.12-bullseye

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

RUN apt-get update && \
    apt-get install --no-install-recommends -y ffmpeg && \
    rm -rf /var/lib/apt/lists/*

RUN uv sync --frozen

COPY downloader /downloader
CMD ["/downloader"]

CMD ["uv", "run", "/downloader"]
