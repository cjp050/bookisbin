require 'sinatra'
require_realative 'bookisbn.rb'

get '/' do 
    erb :index
end 