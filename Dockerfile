FROM python:3.13-trixie

COPY --from=ghcr.io/astral-sh/uv:0.8 /uv /uvx /bin/

RUN apt-get update && \
    apt-get install --no-install-recommends -y ffmpeg && \
    rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://deno.land/install.sh | sh

ADD . /app
WORKDIR /app

RUN uv sync --frozen

COPY downloader /downloader
COPY flaskan.py /flaskan.py
COPY start.sh /start.sh

CMD ["/start.sh"]
