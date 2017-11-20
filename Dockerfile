FROM ruby:2.4.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /crime-overwatch-api
WORKDIR /crime-overwatch-api
ADD Gemfile /crime-overwatch-api/Gemfile
ADD Gemfile.lock /crime-overwatch-api/Gemfile.lock
RUN bundle install
ADD . /crime-overwatch-api
