FROM ruby:2.4.4-alpine

RUN apk add --no-cache --virtual runtime-deps \
  git \
  bash \
  && apk add --no-cache --virtual build-deps \
    alpine-sdk \
    cmake \
    g++ \
    openssl-dev

RUN mkdir /usr/src/app
WORKDIR /usr/src/app

RUN gem install pronto -v 0.9.5
RUN gem install pronto-brakeman -v 0.9.1 \
  && gem install pronto-fasterer -v 0.9.0 \
  && gem install pronto-flay -v 0.9.0 \
  && gem install pronto-haml -v 0.9.0 \
  && gem install pronto-jshint -v 0.9.0 \
  && gem install pronto-rails_best_practices -v 0.9.0 \
  && gem install pronto-reek -v 0.9.1 \
  && gem install pronto-rubocop -v 0.9.1 \
  && gem install pronto-scss -v 0.9.1

RUN apk del build-deps

CMD ["pronto", "run"]
