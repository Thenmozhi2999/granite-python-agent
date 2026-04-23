#!/usr/bin/env bash
set -e

echo "Installing dependencies..."
poetry install --no-root --no-interaction

echo "Running lint and tests..."
ruff check .
black --check .
pytest