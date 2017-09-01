require 'sinatra'
require_relative 'bookisbn.rb'

get '/' do 
    erb :index
end 