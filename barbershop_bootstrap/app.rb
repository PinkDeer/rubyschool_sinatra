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

  # хэш
  hh = {  :username => 'Введите имя',
          :phone => 'Введите номер телефона',
          :datetime => 'Введите дату и время'}

  # для каждой пары ключ-значение
  hh.each do |key, value|

    # если параметр пуст
    if params[key] == ''
      # переменной error присовить value из хэша hh
      # (a value из хэша hh это сообщение об ошибке)
      # т.е. переменной error присвоить сообщение об ошибке
      @error = hh[key]

      # веренуть представление visit
      return erb :visit

    end

  end

=begin
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
=end

  erb "Ok, #{@username}, #{@phone}, #{@datetime}, #{@barber}, #{@color}"
end
