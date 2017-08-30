def isbn10(number)
    
end 

def isbn13(number)

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
