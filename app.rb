require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/user'
require './lib/space'

class MakersBnB < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    erb(:sign_up)
  end

  post '/successful' do
   User.create(name: params[:name], email: params[:email], password: params[:password])
   session[:name] = params[:name]
    redirect '/spaces'
  end

  get '/booking' do

  end

  get '/spaces' do
    @name = User.find(session[:name])
    erb :'spaces/listings'
  end

  post '/spaces/all' do
    @name = User.find(session[:name])
    @listing = Space.listing
    erb :'spaces/listings'
  end

  get '/spaces/new' do
    @name = User.find(session[:name])
    erb :"/spaces/new"
  end
  
  post '/listing' do
    Space.create(name: params[:name], description: params[:description], price: params[:price], start_date: params[:start_date], finish_date: params[:finish_date])
    @listing = Space.listing
    erb :'spaces/listings'
  end

  

  # start the server if ruby file executed directly
  run! if app_file == $0
end
