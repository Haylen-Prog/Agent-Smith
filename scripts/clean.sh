#!/usr/bin/env bash

clean() {
	echo "Cleaning cache file..."; \
	find . \( -name ".mypy_cache" -o -name "__pycache__" \) -exec rm -rf {} +
}

fclean() {
	echo "Erase virtual environnement.. "; \
	find . -type f \( -name ".venv" \) -exec rm -rf {} +
}

erase() {
	echo "Erase virtual environnement.. "; \
}