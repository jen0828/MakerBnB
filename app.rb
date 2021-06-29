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
    @user = User.new(params[:name], params[:email], params[:password])
    redirect '/successful'
  end

  get '/successful' do
    # @name = @user.name
    erb :successful_signup
  end

  get '/booking' do

  end

  get '/spaces' do
    erb :'spaces/listings'
  end

  post '/spaces/all' do
    @listing = Space.listing
    erb :'spaces/listings'
  end

  get '/spaces/new' do
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
