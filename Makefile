SHELL := /bin/bash

.PHONY: build run test

build:
	# build
	-rm /tmp/jaml
	go build -o /tmp/jaml
	@echo

run: build
	# run
	# JSON to YAML
	curl -fSs https://status.github.com/api.json | /tmp/jaml
	@echo
	# YAML to JSON
	curl -fSs https://status.github.com/api.json | /tmp/jaml | /tmp/jaml
	@echo
