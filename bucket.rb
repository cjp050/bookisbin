require 'rubygems'
require 'aws-sdk'
require 'csv'
  load "./local_env.rb" 
def connect_to_bucket(id)
    Aws::S3::Client.new(
    # access_key_id: ENV['AWS_ACCSESS_KEY_ID'],
    # secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    # region: ENV['AWS_REGION'],
  
  )
  file = "awsisbn.csv"
  bucket = 'minedmindstwoboogaloo'
  s3 = Aws::S3::Resource.new(region: 'us-east-2')
  obj = s3.bucket(bucket).object(file)
  # string data
obj.put(body: id)
# push entire file 
# File.open('isbn_output_test.csv', 'rb') do |file|
#   obj.put(body: file)
# end
end
# connect_to_s3