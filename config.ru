# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
require 'rack/reverse_proxy'

use Rack::ReverseProxy do  
  reverse_proxy(/^\/blog(\/.*)$/,
    'http://157.245.140.138/blog$1',
    opts = {:preserve_host => true})
end  

run Rails.application
