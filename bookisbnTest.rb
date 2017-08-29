require "minitest/autorun"
require_relative "bookisbn.rb"
class TestISBN < Minitest::Test

    def test_length
        my_number = "1234"
        isbn = "1234"
        assert_equal(false, isbn_length(isbn))
    end 
end 