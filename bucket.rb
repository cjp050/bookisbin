require 'rubygems'
require 'aws-sdk'
require 'csv'
load "./local_env.rb"

def send_to_bucket(bucketlist)
  Aws::S3::Client.new(
    access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region: ENV['AWS_REGION'])

    file = 'awsisbn.csv'
    write_to_file = File.open(file, "a")
    write_to_file << bucketlist + "\n" 
    write_to_file.close

s3 = Aws::S3::Resource.new(region: 'us-east-2')
   bucket = 'minedmindstwoboogaloo'
   obj = s3.bucket(bucket).object('awsisbn.csv')
     File.open('awsisbn.csv', 'rb') do |file|
        obj.put(body: file) 
    end
end 
  
