def isbn_length (number)
    string = number
    if string.length == 10 
        true
    else string.length == 13
        false
    end 
end 

isbn_length("100")