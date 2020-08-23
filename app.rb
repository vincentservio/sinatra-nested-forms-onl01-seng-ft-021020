require './environment'
require_relative 'app/models/pirate.rb'
require_relative 'app/models/ship.rb'


module FormsLab
  class App < Sinatra::Base
      get '/' do 
         erb :root
        end 
  get '/new' do 
          erb :new
end 

   post '/pirates' do
      @pirate = Pirate.new(params[:pirate])

      params[:pirate][:ships].each do |details|
        Ship.new(details)
      end
      @ships = Ship.all

      erb :'pirates/show'
    end



    # code other routes/actions here

  end
end
