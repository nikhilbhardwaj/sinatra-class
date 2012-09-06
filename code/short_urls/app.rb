require "sinatra"
require "data_mapper"

DataMapper.setup :default, "sqlite://#{Dir.pwd}/shorty-dev.db"

class ShortenedUrl 
  include DataMapper::Resource
  property :id, Serial
  property :url, String ,required: true, key: true
end
DataMapper.finalize

configure :development do  
  DataMapper.auto_upgrade!  
end  

get "/" do
  erb :index
end

post "/" do
  @short_url = ShortenedUrl.first_or_create(url: params[:url])
  puts @short_url.id
  erb :success
end

get "/:shortened" do
  short_url = ShortenedUrl.first(id: params[:shortened])
  redirect short_url.url
end
