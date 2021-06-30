require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/user'
require './lib/space'


class MakersBnB < Sinatra::Base
  enable :sessions, :method_override

  # Users are first directed to the landing page, where they have the ability to sign up:

  get '/' do
    erb(:sign_up)
  end

  get '/login' do
    erb(:login)
  end

  post '/confirm' do
    result = DbConnect.new.connect.query("SELECT * FROM guest WHERE email = '#{params[:email]}'")
    user = User.new(result[0]['id'], result[0]['name'], result[0]['email'])

    session[:user_id] = user.id
    redirect '/spaces'
  end

  # Once the data has been inserted, it is transfered here, where the user object is created and the DB is updated:

  post '/successful' do
   user = User.create(name: params[:name], email: params[:email], password: params[:password])
   session[:user_id] = user.id
    redirect '/spaces'
  end

  get '/booking' do

  end

  # Users will be redirected here to list or view spaces:

  get '/spaces' do
    @user = User.find(session[:user_id])
    @listing = Space.listing
    @available = Space.availability
    erb :'spaces/listings'
  end

  post '/spaces/all' do
    @user = User.find(session[:user_id])
    @listing = Space.listing
    erb :'spaces/listings'
  end

  get '/spaces/new' do
    @user = User.find(session[:user_id])
    @listing = Space.listing
    @available = Space.availability
    erb :"/spaces/new"
  end

  post '/spaces/availability' do
    Space.available(start_date: params[:start_date], finish_date: params[:finish_date])
    @available = Space.availability
    erb :'spaces/listings'
  end 
  
  post '/listing' do
    Space.create(name: params[:name], description: params[:description], price: params[:price], start_date: params[:start_date], finish_date: params[:finish_date])
    @listing = Space.listing
    erb :'spaces/listings'
  end

  

  # start the server if ruby file executed directly
  run! if app_file == $0
end
