require 'test_helper'

class KindergardenTest < ActiveSupport::TestCase
  def setup
    @santiago = cities(:santiagocentro)
    @garden = Kindergarden.new(name: "Estrellita", phone: "898989", city: @santiago)
  end

  test "should be valid" do
    assert @garden.valid?
  end

  test "name should be present" do
    @garden.name = ""
    assert_not @garden.valid?
  end

  test "phone should be present" do
    @garden.phone = ""
    assert_not @garden.valid?
  end
 
  test "city should be present" do
    @garden.city = nil
    assert_not @garden.valid?
  end
end
