require "sinatra"
require_relative "bookisbn.rb"
require_relative "bucket.rb"

get '/' do
erb :index
end 

get '/enter_isbn' do
erb :index
end

post '/enter_isbn' do
isbn_data = params[:isbn_data].to_s
isbn_done = params[:isbn_done].to_s
isbn_done = isbn_check(isbn_data).to_s
redirect '/isbn_out?isbn_done=' + isbn_done.to_s + '&isbn_data=' + isbn_data.to_s
end 

get '/isbn_out' do 
isbn_data = params[:isbn_data]
isbn_done = params[:isbn_done]
connect_to_bucket()
erb :eval, :locals => {:isbn_data=>isbn_data, :isbn_done=>isbn_done}
end

post '/isbn_out' do 
isbn_data = params[:isbn_data]
isbn_done = params[:isbn_done]
connect_to_bucket()
end

