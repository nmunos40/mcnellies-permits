# config valid only for Capistrano 3.1
lock '3.6.1'

set :stages, %w(testing production)
set :default_stage, "production"
set :application, 'permitpal'
set :repo_url, 'https://github.com/bmunos/mcnellies-permits'
set :user, "deploy"


# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/home/deploy/permitpal'

desc "check production task"
task :check_production do
if stage.to_s == "production"
puts " \n Are you REALLY sure you want to deploy to production?"
puts " \n Enter the password to continue\n "
password = STDIN.gets[0..7] rescue nil
if password != 'mypasswd'
puts "\n !!! WRONG PASSWORD !!!"
exit
end
end
end

role :web, "ec2-54-159-121-176.compute-1.amazonaws.com" # Your HTTP server, Apache/etc
role :app, "eec2-54-159-121-176.compute-1.amazonaws.com" # This may be the same as your `Web` server
role :db, "ec2-54-159-121-176.compute-1.amazonaws.com", :primary => true # This is wh

# Default value for :linked_files is []
set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
