# Load DSL and set up stages
require "capistrano/setup"

# Include default deployment tasks
require "capistrano/deploy"

require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

# Include tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
#
# https://github.com/capistrano/rbenv
# https://github.com/capistrano/bundler
# https://github.com/capistrano/rails
#
require "capistrano/rbenv"
require "capistrano/bundler"
require "capistrano/yarn"
require "capistrano/rails/assets"
require "capistrano/rails/migrations"
require "capistrano/puma"
install_plugin Capistrano::Puma
install_plugin Capistrano::Puma::Systemd

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
