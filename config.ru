if ENV['RAILS_ENV'] == 'production' 
  require 'unicorn/worker_killer'

  max_request_min =  500
  max_request_max =  600

  # Max requests per worker
  use Unicorn::WorkerKiller::MaxRequests, max_request_min, max_request_max

  oom_min = (167) * (1024**2)
  oom_max = (184) * (1024**2)

  # Max memory size (RSS) per worker
  use Unicorn::WorkerKiller::Oom, oom_min, oom_max
end



# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
require './blog/run' # Require the run.rb file which has the Rack setup for the blog

map '/blog' do # Anything at blog/ and beyond will then hit the blog
  run Blog
end

map '/' do # By default we want everything to hit our Rails application
  run Rails.application
end







