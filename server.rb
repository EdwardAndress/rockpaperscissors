require 'sinatra/base'
require './lib/player'
require './lib/game'

class RockPaperScissors < Sinatra::Base
  get '/' do
    erb :index
  end

  use Rack::Session::Cookie,  :key => 'rack.session',
                              :path => '/',
                              :secret => 'your_secret'

  get '/new-game' do
  	erb :new_player
  end

  post '/register' do 
  	session[:player] = Player.new(params[:name].downcase.capitalize!)
    if !params[:name].empty?
  	 erb :play
    else
      erb :new_player
    end
  end

  post "/play" do
  	session[:player].picks = params[:pick]
  	computer = generate_computer
  	@game = Game.new(session[:player], computer)
    session[:player].history << params[:pick]
  	erb :outcome
  end

  get "/play_again" do
    erb :play
  end

  def generate_computer
  	choice = ["Rock","Paper","Scissors"].sample

  	comp = Player.new("computer")
  	comp.picks = choice
  	comp
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
