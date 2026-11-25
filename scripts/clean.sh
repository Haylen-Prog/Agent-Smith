#!/usr/bin/env bash

clean() {
	echo "Cleaning cache file..."; \
	find . \( -name ".mypy_cache" -o -name "__pycache__" \) -exec rm -rf {} +
}

fclean() {
	echo "Erase virtual environnement.. "; \
	rm -rf "${1:?}/.venv" .venv
}

erase() {
	echo "Erase all project.."; \
	rm -rf "${1:?}"
	rm -rf "moulinette"
	rm -rf ".venv"
}