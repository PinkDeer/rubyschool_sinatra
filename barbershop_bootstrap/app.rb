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

post '/visit' do

  @username = params[:username]
  @phone = params[:phone]
  @datetime = params[:datetime]
  @barber = params[:barber]
  @color = params[:color]

  erb "Ok, #{@username}, #{@phone}, #{@datetime}, #{@barber}, #{@color}"
end
