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

  if @username == ''
    @error = 'Введите имя'
  end

  if @phone == ''
    @error = 'Введите номер телефона'
  end

  if @datetime == ''
    @error = 'Введите дату и время'
  end

  if @error != ''
    return erb :visit
  end

  erb "Ok, #{@username}, #{@phone}, #{@datetime}, #{@barber}, #{@color}"
end
