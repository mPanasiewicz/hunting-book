#!/usr/bin/env puma
directory '/home/mfind_rails/current'
rackup '/home/mfind_rails/current/config.ru'
environment ENV['RACK_ENV'] || 'development'

# TODO: IN puma integration on production, need to prepare linkto this config in shared/config
# becouse it will be different for production, staging and dev
pidfile "/home/mfind_rails/shared/tmp/pids/puma.pid"
state_path "/home/mfind_rails/shared/tmp/pids/puma.state"
stdout_redirect "/home/mfind_rails/shared/log/puma_access.log", "/home/mfind_rails/shared/log/puma_error.log", true

threads 6, 12
workers 0
preload_app!

bind 'unix:///home/mfind_rails/shared/tmp/sockets/puma.sock'

puts "RACK ENVIROMENT: #{ENV['RACK_ENV']}"
before_fork do
  require 'puma_worker_killer'

  PumaWorkerKiller.config do |config|
    config.ram           = 1024 # mb
    config.frequency     = 5    # seconds
    config.percent_usage = 0.85
    config.rolling_restart_frequency = 6 * 3600 # 6 hours in seconds
  end
  PumaWorkerKiller.start
end

prune_bundler

on_restart do
  puts 'Refreshing Gemfile'
  ENV['BUNDLE_GEMFILE'] = '/home/mfind_rails/current/Gemfile'
end
