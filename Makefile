#
# Makefile
# edgardleal, 2020-02-04 08:04
#

DONE = echo ✓ $@ done
.PHONY: all clean

all: build

.meta: Dockerfile
	mkdir -p .meta

.meta/.docker-image-build: .meta Dockerfile $(SOURCES)
	docker build -t python-for-django .
	@touch .meta/.docker-image-build

build: ## build: create docker image
build: .meta/.docker-image-build

hel%: ## help: Show this help message.
	@echo "usage: make [target] ..."
	@echo ""
	@echo "targets:"
	@grep -Eh '^.+:\ ##\ .+' ${MAKEFILE_LIST} | cut -d ' ' -f '3-' | column -t -s ':'

# vim:ft=make
#
