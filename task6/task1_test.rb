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

end