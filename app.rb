require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/user'

class MakersBnB < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    erb(:sign_up)
  end

  post '/successful' do
    User.create(name: params[:name], email: params[:email], password: params[:password])
    redirect '/successful'
  end

  get '/successful' do
    # @name = @user.name
    erb :successful_signup
  end

  get '/booking' do

  end

  get '/listing' do
    
  end

  get '/request' do
  end

  

  # start the server if ruby file executed directly
  run! if app_file == $0
end
