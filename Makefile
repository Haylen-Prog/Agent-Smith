.PHONY : help install run lint-strict clean fclean erase add remove push

# Usual

help:
	@echo "- USUAL COMMAND -"
	@echo "	install: "
	@echo "	run: "
	@echo "	lint-strict:"
	@echo "	clean: "
	@echo "	fclean: "
	@echo "	erase: "
	@echo "- DEV COMMAND ONLY -"
	@echo "	add: "
	@echo "	remove: "
	@echo "	push: "

install:
	@uv sync

run: install
	@uv run python -m src

sandbox-run: install
	@uv run sandbox

lint-strict: install
	flake8 . && \
	mypy . --strict

clean:
	@. ./scripts/clean.sh && clean

fclean: clean
	@. ./scripts/clean.sh && fclean

erase: fclean
	@. ./scripts/clean.sh && erase

# Dev
add:
	@uv add $(PKG)

remove:
	@uv remove $(PKG)

REMOTE ?= origin

push:
	@set -e; \
	printf "Commit message: "; \
	read -r ANSWER; \
	git add . && git commit -m "$$ANSWER" && git push $(REMOTE)