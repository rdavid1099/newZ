set :stage, :production

server '104.236.216.1', user: 'deploy', roles: %w{web app}
