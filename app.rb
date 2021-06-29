require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/user'

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
    erb :"spaces/listings"
  end

  get '/spaces/new' do
    erb :"/spaces/new"
  end
  
  get '/request' do
  end

  

  # start the server if ruby file executed directly
  run! if app_file == $0
end
