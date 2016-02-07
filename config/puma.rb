app_dir = File.expand_path("../..", __FILE__)
shared_dir = "#{app_dir}/shared"

# Ensure dirs exist
%w(log pids sockets).each { |subdir|
  require 'fileutils'
  dir = "#{shared_dir}/#{subdir}"
  FileUtils.mkdir_p(dir) unless File.directory?(dir)
}

# Default to development mode
rails_env = ENV['RAILS_ENV'] || "development"
environment rails_env

# Use socket for performance boost in production mode
if rails_env == 'production'
  bind "unix://#{shared_dir}/sockets/puma.sock"
else
  bind "tcp://127.0.0.1:3000"
end

# Logging
stdout_redirect "#{shared_dir}/log/puma.stdout.log",
                "#{shared_dir}/log/puma.stderr.log",
                true

# Set master PID and state locations
pidfile "#{shared_dir}/pids/puma.pid"
state_path "#{shared_dir}/pids/puma.state"

workers 2
threads 1, 6
preload_app!

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end

before_fork do
  ActiveRecord::Base.connection_pool.disconnect!
end
