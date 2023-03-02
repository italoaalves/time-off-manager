FROM ruby:3.1.2-slim

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    gnupg2 \
    less \
    git \
    libpq-dev \
    default-libmysqlclient-dev \
    nodejs \
    npm \
    yarn \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG=C.UTF-8 \
  BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3

WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN gem update --system && gem install bundler
RUN bundle install

RUN rails javascript:install:esbuild
RUN rails css:install:bootstrap

EXPOSE 3000

CMD ["rails", "s", "-b", "0.0.0.0"]
