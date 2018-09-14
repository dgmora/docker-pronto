FROM ruby:2.5.1-alpine

RUN apk add --no-cache --virtual runtime-deps \
  git \
  bash \
  openssl-dev \
  alpine-sdk \
  cmake \
  g++

RUN mkdir /usr/src/app
WORKDIR /usr/src/app

ADD Gemfile.pronto /usr/src/app/Gemfile.pronto

RUN gem install bundler
RUN BUNDLE_GEMFILE=Gemfile.pronto bundle install -j16


ENTRYPOINT ["BUNDLE_GEMFILE=Gemfile.pronto","bundle", "exec", "pronto"]
