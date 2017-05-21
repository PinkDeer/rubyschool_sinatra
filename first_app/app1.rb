require 'sinatra'

get '/' do
  erb :index
end

def under_construction
  @title = 'Under constructio'
  @message = 'This page is Uunder construction'
  erb :message
end

get '/contacts' do
  under_construction
end

get '/faq' do
  under_construction
end

get '/something' do
  under_construction
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
