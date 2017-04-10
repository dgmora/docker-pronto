FROM ruby:2.4.1-alpine

RUN apk add --no-cache --virtual .runtime \
  git \
  && apk add --no-cache --virtual .builddeps \
    alpine-sdk \
    cmake

RUN mkdir /usr/src/app
WORKDIR /usr/src/app


RUN gem install bundler \
  && gem install pronto \ 
  && gem install pronto-brakeman \ 
  && gem install pronto-fasterer \ 
  && gem install pronto-flay \ 
  && gem install pronto-haml \ 
  && gem install pronto-jshint \ 
  && gem install pronto-rails_best_practices \ 
  && gem install pronto-rails_schema \ 
  && gem install pronto-reek \ 
  && gem install pronto-rubocop \ 
  && gem install pronto-scss \ 
  && gem install pronto-shellcheck \
  && gem install pronto-slim_lint


ONBUILD ARG PRONTO_GITHUB_ACCESS_TOKEN
ONBUILD ARG PRONTO_GITLAB_API_PRIVATE_TOKEN
ONBUILD ARG PRONTO_BITBUCKET_USERNAME
ONBUILD ARG PRONTO_BITBUCKET_PASSWORD

CMD ["pronto", "run"]
