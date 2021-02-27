# better-tudscr
A template for the tudscr (TUD-Script) LaTeX package. Contains an initial template for any thesis and a containerized build environment with Docker, so that you don’t have to fiddle around with the installation of LaTeX. Just build the Docker image _once_ in advance and use it to build your thesis.

## Quickstart

1. Build the Docker image _once_ with `make container`. (Optional but recommended: Adjust the _DOCKER_IMAGE_ variable inside `Makefile`)
2. Build your thesis with `make thesis`, the *thesis.pdf* is copied to the root of the repository after the build finishes.

Optional steps:

a. If your build fails, check *thesis.log* for further information.
b. If you want a continuous build, use `make serve`. It will continuous build the *thesis.pdf* on every change.
c. If you want a word count, use `make count`.
d. If you want to remove all auxiliary build files, use `make clean`.

All Docker containers are automatically stopped and removed after usage, so you don’t have to do anything in that regard!

## Using the Included Continuous Integration

Every time you commit something to the remote’s `master` or `main` branch, the included Github worklow will build the thesis and upload its build artifacts (thesis.pdf and thesis.log) to the *Releases* as a Draft, so you can simply go and download the build artifacts from *Releases* tab.
