# better-tudscr
A template for the tudscr (TUD-Script) LaTeX package. Contains an initial template for any thesis and a containerized Build with Docker, so that you don't have to fiddle around with the installation of LaTeX. Just pull the Docker image (which is around 4GB, unfortunately) and build the thesis inside.

## Quickstart

1. Setup the Docker container with `make setup-container`
2. Build your thesis with `make in-container`, the *thesis.pdf* is copied to your folder after the build finishes.

Optional steps:

3. If your build fails, check *thesis.log* for further information.
4. If you are finished, stop the container with `make stop-container` or remove the container with `make rm-container`. Or do both with `make teardown-container`.
5. If you want a word count, use `make count-in-container`.

## Building Locally

Use the `make` commands to build your thesis outside the container:
```sh
make verbose # Build the thesis (verbose)
make silent # Build and Output less information
make clean # Cleanup all auxiliary build files
make count # Count all words in the thesis
```

## Using the Included Continuous Integration

Every time you commit something to the remote's `master` branch, the included Github worklow will build the thesis and upload its build artifacts (thesis.pdf and thesis.log) to the *Releases* as a Draft, so you can simply go and download the build artifacts from *Releases* tab.
