# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'wedding_app'
# set :repo_url, 'https://github.com/Cowdrey/wedding_app.git'
set :repository, "."
set :user, "thecowdr"
set :domain, "thecowdreys.com"
set :use_sudo, false

# Default branch is :master
set :branch, "master"
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
set :scm, :git

# Checkout, compress and send a local copy
set :deploy_via, :copy
set :deploy_to, "/home/#{user}/rails_apps/#{application}"

# We have all components of the app on the same server
server domain, :app, :web, :db, :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end

  # Touch tmp/restart.txt to tell Phusion Passenger about new version
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path, 'tmp', 'restart.txt')}"
  end
end

# Clean-up old releases
after "deploy:restart", "deploy:cleanup"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, 'config/database.yml', 'config/secrets.yml'

# Default value for linked_dirs is []
# append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
