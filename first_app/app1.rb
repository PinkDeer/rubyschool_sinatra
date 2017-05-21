require 'sinatra'

get '/' do
  erb :index
end

get '/contacts' do
  @title = 'Contacts'
  @message = 'Phone number: 12313123'
  erb :message
end

get '/faq' do
  @title = 'FAQ'
  @message = 'Under construction'
  erb :message
end

get '/something' do
  @title = 'something'
  @message = 'Bla bla'
  erb :message
end

post '/' do
  @login = params[:login]
  @password = params[:password]

  if @login == 'admin' && @password == 'secret'
    erb :welcome
  elsif @login == 'admin' && @password == 'admin'
    @message = 'Haha, nice try! Access denied!'
  else
    @message = 'Access denied!'
    erb :index
  end

end
