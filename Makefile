SHELL := /bin/bash

.PHONY: build release.build run test

build:
	# build
	go build -o /tmp/jaml
	@echo

release.build:
	# release.build
	GOOS=linux   GOARCH=amd64 go build -o /tmp/jaml-linux-amd64
	GOOS=darwin  GOARCH=amd64 go build -o /tmp/jaml-darwin-amd64
	GOOS=windows GOARCH=amd64 go build -o /tmp/jaml-windows-amd64
	@echo

run: build
	# run
	# JSON to YAML
	curl -fSs https://status.github.com/api.json | /tmp/jaml
	@echo
	# YAML to JSON
	curl -fSs https://status.github.com/api.json | /tmp/jaml | /tmp/jaml
	@echo
