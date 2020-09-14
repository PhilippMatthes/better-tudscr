.PHONY: all

verbose:
	# Build the thesis (verbose)
	latexmk thesis
silent:
	# Output less information
	latexmk thesis -silent
clean:
	# Clean all build artifacts
	latexmk -C
count:
	# Count all words in the document
	texcount -inc thesis.tex

pull-container:
	# Pull the Docker container image
	docker pull aergus/latex

start-container:
	# Start the thesis container
	docker start thesis-container

run-container:
	# Run the thesis container
	docker run --name thesis-container -t -d aergus/latex

setup-container:
	# Convenience shortcut for setting up the thesis container
	$(MAKE) pull-container
	$(MAKE) start-container || $(MAKE) run-container

stop-container:
	# Stop the thesis container
	docker stop thesis-container

remove-container:
	# Remove the thesis container
	docker rm thesis-container

teardown-container:
	# Convenience shortcut for tearing down the thesis container
	$(MAKE) stop-container
	$(MAKE) remove-container

in-container:
	# Build the thesis inside the container
	$(MAKE) in-container-main || $(MAKE) in-container-fallback

in-container-main:
	docker cp . thesis-container:.
	docker exec thesis-container make silent
	docker container cp thesis-container:thesis.pdf .

in-container-fallback:
	docker container cp thesis-container:thesis.log .
	docker container cp thesis-container:thesis.pdf .
	echo "The docker build failed. Please check thesis.log and thesis.pdf."

count-in-container:
	# Compute word counts in the container
	docker cp . thesis-container:.
	docker exec thesis-container make count
