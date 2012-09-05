$:.unshift File.expand_path("../", __FILE__)
require './web'
run Sinatra::Application
