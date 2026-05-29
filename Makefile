SHELL := /bin/bash
.PHONY: build clean open setup watch

# Detect OS for open command
UNAME := $(shell uname -s)
ifeq ($(UNAME),Darwin)
	OPEN_CMD := open
else ifeq ($(UNAME),Linux)
	OPEN_CMD := xdg-open
else
	OPEN_CMD := start
endif

setup:
ifeq ($(UNAME),Darwin)
	@command -v brew >/dev/null || (echo "Install Homebrew first: https://brew.sh" && exit 1)
	brew install tectonic
else ifeq ($(UNAME),Linux)
	@command -v tectonic >/dev/null || (echo "Installing tectonic..." && curl --proto '=https' --tlsv1.2 -fsSL https://drop-sh.fullyjustified.net | sh && sudo mv tectonic /usr/local/bin/)
else
	@echo "Windows: install tectonic via 'winget install tectonic-typesetting.tectonic' or https://tectonic-typesetting.github.io"
endif
	@echo "Setup complete. Run 'make build' to compile."

RESUME_NAME := Ishan_Singh_Software_Engineer_Resume

build:
	tectonic resume.tex
	mv resume.pdf $(RESUME_NAME).pdf

open: build
	$(OPEN_CMD) $(RESUME_NAME).pdf

watch:
	@echo "Watching resume.tex for changes... (Ctrl+C to stop)"
	@while true; do \
		tectonic resume.tex && mv resume.pdf $(RESUME_NAME).pdf; \
		if command -v fswatch >/dev/null 2>&1; then \
			fswatch -1 resume.tex; \
		elif command -v inotifywait >/dev/null 2>&1; then \
			inotifywait -q -e modify resume.tex; \
		else \
			sleep 2; \
		fi \
	done

clean:
	rm -f $(RESUME_NAME).pdf resume.pdf resume.log resume.aux resume.out
