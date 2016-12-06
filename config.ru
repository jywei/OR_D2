# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application

# env = {"REQUEST_METHOD" => "GET", "PATH_INFO" => "/", "rack.input" => StringIO.new }
# response = Rails.application.call(env)
