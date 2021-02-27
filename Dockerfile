ARG USER_ID=1000
ARG USER_NAME=latex
ARG USER_HOME=/home/latex
ARG USER_GECOS=LaTeX
ARG BASE_IMAGE=aergus/latex

FROM ${BASE_IMAGE} as latex

ARG USER_NAME
ARG USER_HOME
ARG USER_ID
ARG USER_GECOS

RUN deluser \
  --remove-home \
  "latex"

RUN adduser \
  --home "$USER_HOME" \
  --uid $USER_ID \
  --gecos "$USER_GECOS" \
  --disabled-password \
  "$USER_NAME"

WORKDIR $USER_HOME

USER $USER_NAME

FROM latex as build

ARG USER_NAME
ARG USER_HOME

COPY --chown=$USER_NAME:$USER_NAME . $USER_HOME

RUN latexmk thesis

FROM scratch

ARG USER_HOME

# Copy the pdf into the image.
COPY --from=build $USER_HOME/thesis.pdf /
COPY --from=build $USER_HOME/thesis.log /