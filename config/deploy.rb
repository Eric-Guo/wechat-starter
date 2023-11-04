# config valid only for current version of Capistrano
lock "~> 3.18.0"

set :application, 'pp_vendor'
# replace your repo_url and do not forget add machine id_rsa.pub to Settings->Deploy keys
set :repo_url, 'https://git.thape.com.cn/Eric-Guo/wechat-starter.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :branch, 'capistrano_deploy'

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, 'config/puma.rb', 'config/application.yml', 'config/master.key', 'public/MP_verify_GOTxa9mVrevYaiBG.txt'

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

set :rbenv_type, :user
set :rbenv_ruby, "3.1.4"

