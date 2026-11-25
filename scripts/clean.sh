#!/usr/bin/env bash

clean() {
	echo "Cleaning cache file..."; \
	find . \( -name ".mypy_cache" -o -name "__pycache__" \) -exec rm -rf {} +
}

fclean() {
	echo "Erase virtual environnement.. "; \
	find "$1/.venv" -exec rm -rf {} +
}

erase() {
	echo "Erase all project.."; \
	rm -rf "/goinfre/azinciry/containers/AgentSmith"
	rm -rf "moulinette"
	rm -rf ".venv"
}