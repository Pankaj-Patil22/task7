require 'test/unit'
require_relative 'task1'

class TestTask1 < Test::Unit::TestCase

    def test_object_type
        assert_equal(String, Serial.new.serial_average("002-10.00-20.00").class)
    end
   
    def test_serial_average
        assert_equal("002-15.00", Serial.new.serial_average("002-10.00-20.00"))
        assert_equal("String is not in the format SSS-XX.XX-YY.YY", Serial.new.serial_average("2-10.00-20.00"))
    end

    def test_retain_if_integer
        hash = HashTest.new
        assert_equal({12=>54, 34=>21, 56=>78, 11=>22, 33=>44, 55=>66,543121=> 100}, hash.retain_if_integer)
    end

    def test_delete_if_even
        hash = HashTest.new 
        assert_equal({"a"=>1, "b"=>2, "c"=>3,11=>22, 33=>44, 55=>66, 543121=>100}, hash.delete_if_even)
    end

    def test_both
        hash = HashTest.new
        assert_equal({"a"=>1, "b"=>2, "c"=>3,11=>22, 33=>44, 55=>66, 543121=>100}, hash.delete_if_even)
        assert_equal({11=>22, 33=>44, 55=>66, 543121=>100}, hash.retain_if_integer)
    end

end