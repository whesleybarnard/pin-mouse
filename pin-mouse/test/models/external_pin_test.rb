require 'test_helper'

class ExternalPinTest < ActiveSupport::TestCase
    test "test the truth" do
        assert true
    end

    test "test validation" do
        pin = ExternalPin.new
        
        assert_not pin.valid? "the model needs fields"

        pin.pin_uuid = '4444'
        pin.resolved = true

        assert pin.valid?, "should be valid"
    end

    # ExternalPin
end