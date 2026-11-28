# Adapted from docker-uv-renv by Daniel Chen (MIT License)
# https://github.com/chendaniely/docker-uv-renv

FROM ubuntu:24.04

COPY --from=ghcr.io/astral-sh/uv:0.13.7 /uv /uvx /usr/local/bin/

WORKDIR /workspace

ENV UV_PROJECT_ENVIRONMENT=/opt/venv

COPY pyproject.toml uv.lock .python-version ./

RUN uv sync --locked
