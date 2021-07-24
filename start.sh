#!/bin/bash
export RUBY_ENVIRONMENT="development"
export RAILS_ENV=development

cd /app
rm -rf tmp/*
#rm -rf log/*
bundle install
yarn
#bundle exec whenever --update-crontab --set environment=development
bundle exec rails assets:precompile
bundle exec rails s -b 0.0.0.0