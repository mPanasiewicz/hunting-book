set :application, 'sales_reports'
set :repo_url, 'git@github.com:mfind-project/mfind-sales-reports.git'

set :keep_releases, 2

set :rvm_ruby_version, '2.3.3'

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle',
                                               'public/system', 'public/uploads')
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml', 'config/puma.rb', '.env')
set :ssh_options, forward_agent: true, auth_methods: ['publickey'], keys: ['/Users/maciejpanasiewicz/.ssh/rogacz.pem']
set :migration_role, :app

set :keep_releases, 2
set :format, :pretty
set :pty, true
set :deploy_via, :remote_cache
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true # Change to true if using ActiveRecord

set :log_level, :debug
namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

namespace :deploy do
  desc 'Make sure local git is in sync with remote.'
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
        puts 'WARNING: HEAD is not the same as origin/master'
        puts 'Run `git push` to sync changes.'
        exit
      end
    end
  end

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
    end
  end

  before :starting,     :check_revision
  after  :finishing,    :compile_assets
  after  :finishing,    :cleanup
  after  :finishing,    :restart
end
