require 'sinatra'
require File.dirname(__FILE__) + '/birthday_countdown.rb'

get '/' do
  @countdown = BirthdayCountdown.new(9,30)
  erb @countdown.to_view, :layout => (request.xhr? ? false : :layout)
end 
