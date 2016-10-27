#!/bin/bash

set -e

rm -f tmp/pids/server.pid

bundle check || bundle install --jobs 20 --retry 5
bundle exec rake db:migrate
bundle exec rails s -b 0.0.0.0 -p 3000
