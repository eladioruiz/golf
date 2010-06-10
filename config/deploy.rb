set :application, "My Golf Card"
set :repository,  "git@github.com:eladioruiz/golf.git"
set :branch, "dev"

set :scm, "git"
set :deploy_to, "/var/www/devgolf"

default_run_options[:pty] = true
set :ssh_options, { :forward_agent => true }
set :user, "admusr"

role :web, "dev.mygolfcard.es"             # Your HTTP server, Apache/etc
role :app, "dev.mygolfcard.es"                          # This may be the same as your `Web` server
role :db,  "dev.mygolfcard.es", :primary => true # This is where Rails migrations will run

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start {}
#   task :stop {}
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
