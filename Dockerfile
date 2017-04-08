FROM ruby:2.4.1

RUN apt-get update && \
    apt-get install -y cmake

RUN mkdir /usr/src/app
WORKDIR /usr/src/app


RUN gem install bundler
RUN gem install pronto
RUN gem install pronto-rubocop

CMD ["pronto", "run"]
