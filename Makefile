install:
	uv sync

run: install
	uv run python -m src

lint:

lint-strict:

push:
	@set -e && \
	read -p "Commit message: " ANSWER && \
	git add . && \
	git log && \
	git commit -m "(ANSWER)" && \
	git push