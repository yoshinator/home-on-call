# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application

reverse_proxy /^\/blog(\/.*)$/, 'http://174.138.39.206/blog/$1', :timeout => 500, :preserve_host => true end
