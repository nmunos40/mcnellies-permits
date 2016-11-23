set :user, "deploy"
server "ec2-54-159-121-176.compute-1.amazonaws.com", :app, :web, :db, :primary => true
ssh_options[:keys] = ["~/Users/Bens_Mac/Documents/Rails_Projects/permitpal.pem"]


