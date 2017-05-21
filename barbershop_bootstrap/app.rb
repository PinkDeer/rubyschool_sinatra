require 'sinatra'

get '/' do
  erb 'Hello'
end

get '/about' do
  erb :about
end

get '/visit' do
  erb :visit
end
