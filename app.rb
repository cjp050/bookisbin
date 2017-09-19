require "sinatra"
require_relative "bookisbn.rb"
require 'aws-sdk'
load './local_env.rb' if File.exist?('./local_env.rb')
Aws.use_bundled_cert!

get '/' do
erb :index
end 

get '/enter_isbn' do
erb :index
end

post '/enter_isbn' do
isbn_data = params[:isbn_data].to_s
isbn_done = params[:isbn_done].to_s
isbn_done = isbn_check(isbn_data)
p isbn_done
#isbn_done = isbn_text(isbn_done).to_s
p isbn_done
redirect '/isbn_out?isbn_done=' + isbn_done.to_s + '&isbn_data=' + isbn_data.to_s
end 

get '/isbn_out' do 
isbn_data = params[:isbn_data]
isbn_done = params[:isbn_done]
#push_to_bucket(isbn_data, isbn_done)

erb :eval, :locals => {:isbn_data=>isbn_data, :isbn_done=>isbn_done}
end

post '/isbn_out' do 

isbn_data = params[:isbn_data]
isbn_done = params[:isbn_done]

end


