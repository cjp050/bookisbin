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
    
         true
    else
         false
    end
    end
 
 def check_class(number) 
    if number.is_a? String 
    elsif number.is_a? Array
    number = "#{number}".join("",'')
    number = number.to_s
    elsif  number.is_a? Integer
    number = number.to_s
    else 
        false
    end
    number.is_a? String
    end

def numbers_only(number)
    number !~ /\D/
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
