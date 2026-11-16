#!/usr/bin/env bash

find . \( -name ".mypy_cache" -o -name "__pycache__" \) -exec rm -rf {}
