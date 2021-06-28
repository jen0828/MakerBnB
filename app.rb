require 'sinatra/base'
require 'sinatra/reloader'

class MakersBnB < Sinatra::Base
  get '/' do
    erb :sign_up
  end

  get '/successful' do

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
