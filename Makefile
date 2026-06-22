.PHONY: all init bin lib docs

all: init bin lib

init:
	@echo "building init..."

bin:
	@echo "building userspace binaries..."

lib:
	@echo "building libraries..."

docs:
	./build-docs.sh
