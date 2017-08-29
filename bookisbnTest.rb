require "minitest/autorun"
require_relative "bookisbn.rb"
class TestISBN < Minitest::Test

    def test_length
        my_number = "1234"
        isbn = "1234"
        assert_equal(false, isbn_length(isbn))
    end 
 

    def test_two 
        isbn = "1234567890"
        assert_equal(true, isbn_length(isbn))
    end 
end 
