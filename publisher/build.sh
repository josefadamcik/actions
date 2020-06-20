#!/bin/sh

bundle install -j=4
JEKYLL_ENV=production bundle exec jekyll build