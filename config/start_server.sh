#!/bin/bash
cd /var/www/journal
bundle exec unicorn -c config/unicorn/production.rb -E production -D
nginx

