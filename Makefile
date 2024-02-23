#!make

DIR:=$(shell sh -c "pwd")
USER_ID:=$(shell sh -c "id -u")
USER_NAME:=$(shell sh -c "id -u -n")
USER_HOME:=/home/latex
BASE_IMAGE:=ghcr.io/felix-kaestner/latex:1.0 
DOCKER_IMAGE:=mustermann/latex

# Check if any of the args are empty.
ifndef DIR
$(error DIR is undefined)
endif
ifndef USER_ID
$(error USER_ID is undefined)
endif
ifndef USER_NAME
$(error USER_NAME is undefined)
endif

# Log all variables.
$(info DIR is $(DIR))
$(info USER_ID is $(USER_ID))
$(info USER_NAME is $(USER_NAME))

.PHONY: all

thesis:
	@docker build --output ./ .

shell:
	@docker run -it --rm -v $(DIR):$(USER_HOME) $(DOCKER_IMAGE) bash

clean:
	@docker run --rm -v $(DIR):$(USER_HOME) $(DOCKER_IMAGE) bash -c "latexmk -C"

count:
	@docker run --rm -v $(DIR):$(USER_HOME) $(DOCKER_IMAGE) bash -c "texcount -inc thesis.tex"

container:
	@docker build --build-arg USER_ID=$(USER_ID) --build-arg USER_NAME=$(USER_NAME) --build-arg USER_HOME=$(USER_HOME) --build-arg BASE_IMAGE=$(BASE_IMAGE) --target latex -t $(DOCKER_IMAGE) .