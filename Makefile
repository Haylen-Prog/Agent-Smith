PROJECT = /goinfre/azinciry/containers/AgentSmith

.PHONY : help setup install run sandbox-run lint-strict clean fclean erase add remove push

# Usual

help:
	@echo "- USUAL COMMAND -"
	@echo "	setup: "
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

setup:
	@uv python install 3.10; \
	uv python pin 3.10; \
	mkdir "$(PROJECT)/"; \
	uv venv "$(PROJECT)/.venv"; \
	ln -s "$(PROJECT)/.venv" ".venv"
	cp "moulinette.zip" "$(PROJECT)"; \
	cd  "$(PROJECT)"; \
	unzip "moulinette.zip"
	@ln -s "$(PROJECT)/moulinette" "moulinette"

install: setup
	@uv sync

run: install
	@uv run python -m src

sandbox-run: install
	@uv run sandbox

lint-strict: install
	@uv run flake8 src && \
	uv run mypy src --strict

clean:
	@. ./scripts/clean.sh && clean

fclean: clean
	@. ./scripts/clean.sh && fclean $(PROJECT)

erase:
	@. ./scripts/clean.sh && erase

# Dev
add:
	@uv add $(PKG)

remove:
	@uv remove $(PKG)

REMOTE ?= all

push:
	@set -e; \
	printf "Commit message: "; \
	read -r ANSWER; \
	git add . && git commit -m "$$ANSWER" && git push $(REMOTE)