def isbn_10(number)
    clean_number = clean("#{number}")
    isbn_length("#{clean_number}") 
end 

def clean(number) 
    string = number
    string.gsub!("-", "")
    string.gsub(" ", "")
    if 
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
