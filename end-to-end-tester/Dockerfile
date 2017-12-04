FROM ruby:2.3.3-slim

ARG BUILD_PACKAGES="git-core openssh-client g++ make libssl-dev"

ENV LANG=C.UTF-8

# create deploy user first to prevent packages from hijacking our canonical uid
RUN adduser --disabled-password --system --uid 1000 deploy

# install build deps
RUN apt-get update && \
    apt-get dist-upgrade -q -y && \
    apt-get install -q -y --no-install-recommends $BUILD_PACKAGES

RUN chown -Rh deploy /home/deploy
WORKDIR /home/deploy/app

COPY Gemfile /home/deploy/app
RUN bundle --path=~/bundle

# copy actual app sources
ADD . /home/deploy/app
