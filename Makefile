SHELL := /bin/bash
BIN_NAME := jaml
GOARCH := amd64
GOLDFLAGS := "-X 'main.date=$(shell TZ=Asia/Tokyo date +%Y%m%dT%H%M%S+0900)' -X 'main.hash=$(shell git rev-parse HEAD)' -X 'main.goversion=$(shell go version)'"

.PHONY: build install run release.build

build:
	# build
	-rm -rf ./build/${BIN_NAME}*
	mkdir -p ./build
	go build -o ./build/${BIN_NAME}
	@echo

install: build
	# install
	sudo mv ./build/${BIN_NAME} /usr/local/bin
	@echo
	ls -l /usr/local/bin/${BIN_NAME}
	@echo

run:
	# run
	# JSON to YAML
	curl -fSs https://status.github.com/api.json |\
		go run `find . -name "*.go" | grep -Ev ".+_test\.go"`
	@echo
	# YAML to JSON
	curl -fSs https://status.github.com/api.json |\
		go run `find . -name "*.go" | grep -Ev ".+_test\.go"` |\
		go run `find . -name "*.go" | grep -Ev ".+_test\.go"`
	@echo

release.build:
	# release.build
	-rm -rf ./build
	mkdir -p ./build
	export GOOS=linux GOARCH=amd64; go build -o ./build/${BIN_NAME}_$${GOOS}_$${GOARCH}
	export GOOS=darwin GOARCH=amd64; go build -o ./build/${BIN_NAME}_$${GOOS}_$${GOARCH}
	export GOOS=windows GOARCH=amd64; go build -o ./build/${BIN_NAME}_$${GOOS}_$${GOARCH}.exe
	@ls -l ./build/jaml*


