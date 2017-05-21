require 'sinatra'

get '/' do
  erb :index
end

post '/' do
  @user_name = params[:user_name]
  @phone = params[:phone]
  @date_time = params[:date_time]

  @title = 'Thank you!'
  @message = "Dear #{@user_name}, we`ll be waiting for at #{@date_time}"

  f = File.open './public/user.txt', 'a'
  f.write "User: #{@username}, Phone: #{@phone}, Date and time #{@date_time}\n"
  f.close

  erb :message
end



=begin
get '/admin' do
  erb :admin
end

post '/admin' do
  @login = params[:login]
  @password = params[:password]
  @user_txt = params[:user_txt]

  if @login == 'admin' && @password == '123123'
    @user_txt = File.open("user.txt","r")
    erb :admin
    @user_txt.close
  elsif @login == 'admin' && @password == 'admin'
    @message = 'Haha, nice try! Access denied!'
    erb :admin
  else
    @message = 'Access denied!'
    erb :admin
  end
end
=end
