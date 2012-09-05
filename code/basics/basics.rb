require 'sinatra'

get "/" do
  "Hello World"
end

# 1. Basic Routing
get "/reverse/:string" do
  params[:string].reverse
end

# 3. Templates and Views
 get '/about' do  
   @about = 'Get to know a little about me.'  
   erb :about
end    

# 2. More Parameters
get '/hello/:name/:city' do  
  "Hey there #{params[:name]} from #{params[:city]}."  
end

# 4. Forms and POST
get "/greet" do
  erb :form
end

post "/greet" do
  "You said #{params[:message]}"
end
