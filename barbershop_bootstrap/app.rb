require 'sinatra'
require 'sqlite3'

def is_barber_exists? db, name
  db.execute('select *from Barbers where name=?', [name]).length > 0
end

def seed_db db, barbers
  barbers.each do |barber|
    if !is_barber_exists? db, barber
      db.execute 'insert into Barbers (name) values (?)', [barber]
    end
  end
end

def get_db
  db = SQLite3::Database.new 'barbershop.db'
  db.results_as_hash = true
  return db
end

before do
  db = get_db
  @barbers = db.execute 'select * from Barbers'
end

configure do
  db = SQLite3::Database.new 'barbershop.db'
  db.execute 'CREATE TABLE IF NOT EXISTS "Users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT, "username" TEXT, "phone" TEXT, "datestamp" TEXT, "barber" TEXT, "color" TEXT)'
  db.execute 'CREATE TABLE IF NOT EXISTS "Barbers" ("id" INTEGER PRIMARY KEY AUTOINCREMENT, "name" TEXT)'

  seed_db db, ['Ivan Ivanov', 'Petr Petrov', 'Nikita Nikitin']
end

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

  # validaion ver 1

  hh = {  :username => 'Введите имя',
          :phone => 'Введите номер телефона',
          :datetime => 'Введите дату и время'}

  @error = hh.select {|key,_| params[key] == ""}.values.join(", ")

  if @error != ''
    return erb :visit
  end

  # validaion ver 2

=begin
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
=end

# validaion ver 3

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

  db = get_db
  db.execute 'insert into Users (username, phone, datestamp, barber, color) values (?, ?, ?, ?, ?)', [@username, @phone, @datetime, @barber, @color]

  erb "Ok, #{@username}, #{@phone}, #{@datetime}, #{@barber}, #{@color}"
end

get '/showusers' do
  db = get_db

  @results = db.execute 'select * from Users order by id desc'
  erb :showusers
end
