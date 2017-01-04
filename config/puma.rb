#!/usr/bin/env puma
shared_path = File.expand_path("../..", __FILE__)

directory shared_path
rackup "#{shared_path}/config.ru"
environment ENV['RACK_ENV'] || 'development'

# TODO: IN puma integration on production, need to prepare linkto this config in shared/config
# becouse it will be different for production, staging and dev
pidfile "#{shared_path}/tmp/pids/puma.pid"
state_path "#{shared_path}/tmp/pids/puma.state"
stdout_redirect "#{shared_path}/log/puma_access.log", "#{shared_path}/log/puma_error.log", true

threads 8, 24
workers 4
preload_app!

bind "unix:///#{shared_path}/tmp/sockets/puma.sock"

puts "RACK ENVIROMENT: #{ENV['RACK_ENV']}"
before_fork do
  require 'puma_worker_killer'

  PumaWorkerKiller.config do |config|
    config.ram           = 4096 # mb
    config.frequency     = 5    # seconds
    config.percent_usage = 0.70
    config.rolling_restart_frequency = 6 * 3600 # 6 hours in seconds
  end
  PumaWorkerKiller.start
end

prune_bundler

on_worker_boot do
  ActiveRecord::Base.establish_connection
end

on_restart do
  puts 'Refreshing Gemfile'
  ENV['BUNDLE_GEMFILE'] = "#{shared_path}/Gemfile"
end
