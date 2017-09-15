require_relative 'bucket.rb'

def isbn_check(number)
	if check_class(number) == true
		number = clean(number)
		if numbers_only(number) == true
			if isbn_length(number) == true
				math_isbn_10(number)
			elsif isbn_length_13(number) == true
				math_isbn_13(number)
            else
                valid = false 
                bucketlist = number.to_s + ", " + valid.to_s
                send_to_bucket(bucketlist)
                valid
			end
        else
            valid = false
            bucketlist = number.to_s + ", " + valid.to_s
            send_to_bucket(bucketlist)
            valid
		end
    else
        valid = false
        bucketlist = number.to_s + ", " + valid.to_s
        send_to_bucket(bucketlist)
        valid
    end
     
end 
 
#   isbn_check ("mined")
#   isbn_check("04") 
#   isbn_check ("1234567890")
#   isbn_check("047 19- 5- 86-97-")
#   isbn_check("047 19 5 8697")
#   isbn_check("0471958697")
#   isbn_check("0321146530")
#   isbn_check("877195869x")
#   isbn_check("9780470059029")
#   isbn_check("9780131495050")
#   isbn_check("9780471486480")
#   isbn_check("4780470059029")
#   isbn_check("0-321@14653-0")
#   isbn_check("877195x869")
#   isbn_check("")
#   isbn_check(" ")
#   isbn_check("-")
  # isbn_check("978013149505x")

def math_isbn_10(number)
    isbn = number
    isbn = isbn.scan /\w/
    isbn = isbn[0..9]
    total = (1*isbn[0].to_i) + (2*isbn[1].to_i) + (3*isbn[2].to_i) + (4*isbn[3].to_i) + (5*isbn[4].to_i) + (6*isbn[5].to_i) + (7*isbn[6].to_i) + (8*isbn[7].to_i) + (9*isbn[8].to_i) 
    check_sum = total % 11
    if check_sum == 10 
        check_sum = ("x").to_s
    else
        isbn[9] = isbn[9].to_i
    end
    if check_sum == isbn[9]
        valid = true
        bucketlist = number.to_s + ", " + valid.to_s
        send_to_bucket(bucketlist)
        valid
    else
        valid = false
        bucketlist = number.to_s + ", " + valid.to_s
        send_to_bucket(bucketlist)
        valid
    end
 end

    def math_isbn_13(number)
        isbn = number
        isbn = isbn.scan /\w/
        isbn = isbn[0..12]
        total = (1*isbn[0].to_i) + (3*isbn[1].to_i) + (1*isbn[2].to_i) + (3*isbn[3].to_i) + (1*isbn[4].to_i) + (3*isbn[5].to_i) + (1*isbn[6].to_i) + (3*isbn[7].to_i) + (1*isbn[8].to_i) + (3*isbn[9].to_i) + (1*isbn[10].to_i) + (3*isbn[11].to_i) 
        total = total % 10
        ten = 10
        post_total = ten - total
        post_total = post_total % 10
        isbn[12] = isbn[12].to_i
        if post_total == isbn[12]
            valid = true
            bucketlist = number.to_s + ", " + valid.to_s
            send_to_bucket(bucketlist)
            valid
        else
            valid = false
            bucketlist = number.to_s + ", " + valid.to_s
            send_to_bucket(bucketlist)
            valid
    end
 end
 
    def check_class(number) 
        if number.is_a? String 
        elsif number.is_a? Array
             number = "#{number}".join("",'')
             number = number.to_s
         elsif number.is_a? Integer
             number = number.to_s
         else 
              false
          end
    number.is_a? String
 end

    def numbers_only(number)
        if number !~ /\D/    
           true
       elsif
           number.chop !~ /\D/
           true
       else 
           false
       end 
       end

def isbn_10(number)
    clean_number = clean("#{number}")
    isbn_length("#{clean_number}") 
    end 

def clean(number)
    string = number
    string.gsub!("-", "")
    string.gsub(" ", "")
    end 

def isbn_length (number)
    string = number
    if string.length == 10 
        true
    else 
        false
    end 
end 

    def isbn_length_13 (number)
        string = number
        if string.length == 13
            true
        else 
            false
    end     
end 

# 1-18 does everything that the other functions do
# 39-56 gives the rules how to decode a 10 digit ISBN
# 58-73 gives the rules how to decode a 13 digit ISBN
# 75-86 determines if its a ISBN-10 / ISBN-13
# 88-97 gives a subset of rules for numbers only
# 99-102 cleans 10 digit numbers*
# *104-108 clean: removes - and spaces
# 110-126 rules for both ISBN 10 and 13 
