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

    def test_three
        isbn = "1234"
        assert_equal(false, isbn_length_13(isbn))
    end 

    def test_four
        isbn = "1234567890123"
        assert_equal(true, isbn_length_13(isbn))
    end
    
    def test_five
        isbn = "1-2-3"
        assert_equal("123", clean(isbn))
    end 
    
    def test_six
        isbn = "1 2 3"
        assert_equal("123", clean(isbn))
    end 

    def test_nine
        isbn = "1y23"
        isb1 = "1-2-3"
        isb2 = "123"
        assert_equal(false, numbers_only(isbn))
        assert_equal(false, numbers_only(isb1))
        assert_equal(true, numbers_only(isb2))
    end

    def test_check_if_string_converts_array_and_integer
        isbn = "123"
        isb1 = ["3","2","1"]
        isb2 = 123
        assert_equal(true, numbers_only(isbn))
        assert_equal(true, numbers_only(isb1))
        assert_equal(true, numbers_only(isb2))
    end
end 

   