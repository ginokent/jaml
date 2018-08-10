SHELL := /bin/bash
BIN_NAME := jaml

.PHONY: build release.build run test

build:
	# build
	go build -o /tmp/${BIN_NAME}
	@echo

install: build
	# install
	sudo mv /tmp/${BIN_NAME} /usr/local/bin
	@echo
	ls -l /usr/local/bin/${BIN_NAME}
	@echo

run: build
	# run
	# JSON to YAML
	curl -fSs https://status.github.com/api.json | /tmp/${BIN_NAME}
	@echo
	# YAML to JSON
	curl -fSs https://status.github.com/api.json | /tmp/${BIN_NAME} | /tmp/${BIN_NAME}
	@echo

release.build:
	# release.build
	GOOS=linux   GOARCH=amd64 go build -o /tmp/${BIN_NAME}-linux-amd64
	GOOS=darwin  GOARCH=amd64 go build -o /tmp/${BIN_NAME}-darwin-amd64
	GOOS=windows GOARCH=amd64 go build -o /tmp/${BIN_NAME}-windows-amd64
	@echo


