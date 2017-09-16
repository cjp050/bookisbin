require "rubygems"
require "aws-sdk"
load './local_env.rb' if File.exist?('./local_env.rb')
#Aws.use_bundled_cert!
def connect_to_bucket(id)
 
Aws::S3::Client.new(
  # access_key_id:ENV['AWS_ACCESS_KEY_ID']
  # secret_access_key:ENV['AWS_SECRET_ACCESS_KEY']
  # region:ENV['AWS_REGION'] 
)
#id = "Tordffei" + "/n"
  file = 'awsisbn.csv'
  write_file = File.open(file, "a") #"a" stands for "append" and adds to the csv file
  write_file << id    #adds value of id to the file
  write_file.close
  bucket = 'minedmindstwoboogaloo'
  s3 = Aws::S3::Resource.new(region: 'us-east-2')
  obj = s3.bucket(bucket).object(file) #connects to bucket
  File.open(file, 'rb') do |file|
obj.put(body: file) #pushes new values into file & bucket
end
end

def get_file()
  s3 = Aws::S3::Client.new #initializes
  aws_file = s3.get_object(bucket: 'minedmindstwoboogaloo', key: 'awsisbn.csv') #gets specific bucket and file
  aws_file = aws_file.body.read
  id_array = aws_file.split #places text from csv file into array
    list_of_isbn = [] #will hold values of id_array
    # p id_array
    id_array.each do |value|
      # p value
      p value.gsub!(/"/, '') #removes specified characters
      # p value
      list_of_isbn << value 
      
    end 
    # p test
    puts "#{list_of_isbn} IS HERE"

end
# get_file()


#connect_to_bucket(id)