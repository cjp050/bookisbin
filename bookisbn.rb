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
