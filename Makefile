#!make

DIR:=$(shell sh -c "pwd")
USER_ID:=$(shell sh -c "id -u")
USER_NAME:=$(shell sh -c "id -u -n")
USER_HOME:=/home/latex
BASE_IMAGE:=kaestner/latex
DOCKER_IMAGE:=mustermann/latex

.PHONY: all

thesis:
	@docker build --output ./ .

shell: container
	@docker run -it --rm -v $(DIR):$(USER_HOME) $(DOCKER_IMAGE) bash

clean: container
	@docker run --rm -v $(DIR):$(USER_HOME) $(DOCKER_IMAGE) bash -c "latexmk -C"

count: container
	@docker run --rm -v $(DIR):$(USER_HOME) $(DOCKER_IMAGE) bash -c "texcount -inc thesis.tex"

container:
	@docker build --build-arg USER_ID=$(USER_ID) --build-arg USER_NAME=$(USER_NAME) --build-arg USER_HOME=$(USER_HOME) --build-arg BASE_IMAGE=$(BASE_IMAGE) --target latex -t $(DOCKER_IMAGE) .