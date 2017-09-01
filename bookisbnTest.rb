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

    def test_full
		isbn = "mined"
		isb1 = "04" 
		isb2 = "1234567890"
		isb3 = "047 19- 5- 86-97-"
	  	isb4 = "047 19 5 8697"
	  	isb5 = "0471958697"
	  	isb6 = "0321146530"
	  	isb7 = "877195869x"
	  	isb8 = "9780470059029"
	  	isb9 = "9780131495050"
	  	isb10 = "9780471486480"
	  	isb11 = "4780470059029"
	  	isb12 = "0-321@14653-0"
	  	isb13 = "877195x869"
	  	isb14 = ""
	  	isb15 = " "
	  	isb16 = "-"
	  #	isb17 = "978013149505x"
		assert_equal(false, isbn_check(isbn))
		assert_equal(false, isbn_check(isb1))
		assert_equal(false, isbn_check(isb2))
		assert_equal(true, isbn_check(isb3))
		assert_equal(true, isbn_check(isb4))
		assert_equal(true, isbn_check(isb5))
		assert_equal(true, isbn_check(isb6))
		assert_equal(true, isbn_check(isb7))
		assert_equal(true, isbn_check(isb8))
		assert_equal(true, isbn_check(isb9))
		assert_equal(true, isbn_check(isb10))
		assert_equal(false, isbn_check(isb11))
		assert_equal(false, isbn_check(isb12))
		assert_equal(false, isbn_check(isb13))
		assert_equal(false, isbn_check(isb14))
		assert_equal(false, isbn_check(isb15))
		assert_equal(false, isbn_check(isb16))
		#assert_equal(false, isbn_check(isb17))
    end
end 

   