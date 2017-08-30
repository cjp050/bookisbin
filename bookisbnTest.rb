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
 
    def test_isnn_10_math
        isbn = "0471958697"
        isb1 = "0321146530"
        isb2 = "877195869x"
        isb3 = "1234567890"
        isb4 = "0987654321"
        assert_equal(true, math_isbn_10(isbn))
        assert_equal(true, math_isbn_10(isb1))
        assert_equal(true, math_isbn_10(isb2))
        assert_equal(false, math_isbn_10(isb3))
        assert_equal(false, math_isbn_10(isb4))
    end

    def test_isnn_13_math
        isbn = "9780470059029"
        isb1 = "978-0-13-149505-0"
        isb2 = "978 0 471 48648 0"
        assert_equal(true, math_isbn_13(isbn))
        assert_equal(true, math_isbn_13(isb1))
        assert_equal(true, math_isbn_13(isb2))
    end
end 

   