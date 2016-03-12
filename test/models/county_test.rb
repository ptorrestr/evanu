require 'test_helper'

class CountyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @country = Country.new(name: "Ireland")
    @state = State.new(name: "Galway", country: @country)
    @state2 = State.new(name: "Connemara", country: @country)
    @county = County.new(name: "Galway", state: @state)
  end

  test "should be valid" do
    assert @county.valid?
  end

  test "name should be present" do
    @county.name = ""
    assert_not @county.valid?
  end

  test "state should be present" do
    @county.state = nil
    assert_not @county.valid?
  end

  test "name should be unique for a county" do
    duplicate_county = @county.dup
    duplicate_county.name = @county.name.upcase
    @country.save
    @state.save
    @county.save
    assert_not duplicate_county.valid?
  end

  test "name should not be unique for different states" do
    duplicate_county = @county.dup
    duplicate_county.name = @county.name.upcase
    duplicate_county.state = @state2
    @country.save
    @state2.save
    @county.save
    assert duplicate_county.valid?
  end
end
