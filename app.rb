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
    user = User.authenticate(email: params[:email], password: params[:password])

    if user == nil
      redirect '/error'
    else
      session[:user_id] = user.id
      user.loged_in = true
      session[:user_status] = user.loged_in 
      redirect '/spaces'
    end
  end

  get '/logout' do
    erb(:logout)
  end

  post '/logout' do
    user = User.find(session[:user_id])
    user.loged_in = false
    session[:user_status] = user.loged_in

    redirect '/goodbye'
  end

  get '/error' do
    erb(:error)
  end

  # Once the data has been inserted, it is transfered here, where the user object is created and the DB is updated:

  post '/successful' do
   user = User.create(name: params[:name], email: params[:email], password: params[:password])
   session[:user_id] = user.id
    redirect '/login'
  end

  get '/booking' do

  end

  # Users will be redirected here to list or view spaces:

  get '/spaces' do
    @user = User.find(session[:user_id])
    @listing = Space.listing
    redirect '/error' unless session[:user_status] == true
    erb :'spaces/listings'
  end

 # Users 

  post '/spaces/all' do
    @user = User.find(session[:user_id])
    @listing = Space.listing
    erb :'spaces/listings'
  end

  get '/spaces/new' do
    @user = User.find(session[:user_id])
    @listing = Space.listing

    redirect '/error' unless session[:user_status] == true
    erb :"/spaces/new"
  end

  post '/spaces/availability' do
    @user = User.find(session[:user_id])
    Space.available(start_date: params[:start_date], finish_date: params[:finish_date])
    @name = User.find(session[:name])
    @available = Space.availability
    erb :'spaces/listings'
  end 
  
  post '/listing' do
    @user = User.find(session[:user_id])

    Space.create(name: params[:name], description: params[:description], price: params[:price], start_date: params[:start_date], finish_date: params[:finish_date])
    @listing = Space.listing
    erb :'spaces/listings'
  end

  get '/goodbye' do
    erb(:goodbye)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
