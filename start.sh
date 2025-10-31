#!/usr/bin/env bash

uv run /downloader &
uv run flask --app flaskan.py run -p 5555 --host=0.0.0.0
