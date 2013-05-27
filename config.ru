# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
Resque.redis='192.168.1.4:6379'
run TwitterResque::Application
