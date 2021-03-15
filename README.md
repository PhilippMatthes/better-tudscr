# better-tudscr
A template for the tudscr (TUD-Script) LaTeX package. Contains an initial template for any thesis and a containerized build environment with Docker, so that you don’t have to fiddle around with the installation of LaTeX. Just build the Docker image _once_ in advance and use it to build your thesis.

## Quickstart

1. Build the Docker image _once_ with `make container`. 
2. Build your thesis with `make thesis`, the *thesis.pdf* is copied to the root of the repository after the build finishes.

Optional steps:

* If your build fails, check *thesis.log* for further information.
* If you want a word count, use `make count`.
* If you want to remove all auxiliary build files, use `make clean`.
* If you want to change the image name of the latex image produced by `make container`, adjust the _DOCKER_IMAGE_ variable inside `Makefile`
* If you want a continuous build, configure the `latex-workshop.latex.autoBuild.run`-setting described below.

All Docker containers are automatically stopped and removed after usage, so you don’t have to do anything in that regard!

## Using the Included Continuous Integration

Every time you commit something to the remote’s `master` or `main` branch, the included Github worklow will build the thesis and upload its build artifacts (thesis.pdf and thesis.log) to the *Releases* as a Draft, so you can simply go and download the build artifacts from *Releases* tab.

If you want to skip the CI you can simply put `ci skip` or `skip ci` in your commit message, and it will not build the thesis and won't create a release. For example: `git commit -m "Something I have written [skip ci]"`.

## Visual Studio Code

As Visual Studio Code is the most used Text-Editor, this repository provides some extension recommendations and related workspace settings, which will boost your writing.

**Extensions**

The following recommended extensions are definded in `.vscode/extensions.json`:

1. [vscode-ltext](https://github.com/valentjn/vscode-ltex): This extension provides spelling correction, but also grammar checks and stylistic errors. All of this is based on  [languagetool](https://languagetool.org/de), which is a very powerful tool, that is able to track high level language concepts, such as cases (e.g., for German) or commas.

2. [latex-workshop](https://github.com/James-Yu/LaTeX-Workshop): Most widely used LaTex Extension for VSCode. Provides language support and syntax highlighting and is able to build your thesis inside VSCode.

If you open this project in VSCode, it will ask you if you would like to install both extensions.

**Settings**

The following workspace settings are definded in `.vscode/settings.json`:

- `"editor.wordWrap": "on"` - tells VSCode to automatically wrap lines if the text is too wide, which avoids newlines.
- `"ltex.enabled": true` - enables the `vscode-ltext` extension
- `"ltex.language": "en-US"` - defines the language for the spelling and grammar checks. Change this value to `de-DE` if you are writing a German thesis.
- `"ltex.additionalRules.motherTongue": "en-US"` - defines the mother tongue of the writer for the `vscode-ltext` extension. Change this value to `de-DE` if you are writing a German thesis.
- `"ltex.additionalRules.enablePickyRules": true` - enables warnings for picky rules such as passive voice or sentence length.
- `"ltex.checkFrequency": "edit"` - will check spelling and grammar while you are typing. If you want you can set this value to `save`, if you only want to check after you saved the file.
- `"latex-workshop.docker.enabled": true` - enables to docker mode of the `latex-workshop` extension. Thus, no local installation of LaTex is needed, since it will use docker to build the thesis.
- `"latex-workshop.docker.image.latex": "kaestner/latex"` - defines the docker image, which is used to build the thesis using the `latex-workshop` extension. This will be [kaestner/latex](https://hub.docker.com/repository/docker/kaestner/latex)
- `"latex-workshop.latex.autoBuild.run": "never"` - disables automatic runs of the `latex-workshop` extension. You can manually trigger a build by using the command prompt in VSCode or by clicking on the Play-Button in the top right.