require 'sinatra/base'

class MakersBnB < Sinatra::Base
  get '/' do
    'Hello MakersBnB!'
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
