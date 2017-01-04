# be sure to comment out the require 'capistrano/deploy' line in your Capfile!
# config valid only for Capistrano 3.1+
lock '3.7.1'

server 'ec2-52-50-219-153.eu-west-1.compute.amazonaws.com', user: 'ubuntu', roles: %w(app db web)
set :rails_env, :production
set :rack_env, :production
set :stage, :production
set :user, 'ubuntu'

set :rvm_type, :user # or :system, depends on your rbenv setup
set :puma_conf, "/home/#{fetch(:user)}/shared/config/puma.rb"
set :deploy_to, "/home/#{fetch(:user)}"
set :domain, 'c2-52-50-219-153.eu-west-1.compute.amazonaws.com'
# set :branch, :master

ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp } # if you want to set the branch by hand
