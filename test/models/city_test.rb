require 'test_helper'

class CityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @country = Country.new(name: "Ireland")
    @state = State.new(name: "Connemara", country: @country)
    @county = County.new(name: "Galway", state: @state)
    @county2 = County.new(name: "Sligo", state: @state)
    @city = City.new(name: "Galway city", county: @county)
  end

  test "should be valid" do
    assert @city.valid?
  end

  test "name should be present" do
    @city.name = ""
    assert_not @city.valid?
  end

  test "county should be present" do
    @city.county = nil
    assert_not @city.valid?
  end

  test "name should be unique for a county" do
    duplicate_city = @city.dup
    duplicate_city.name = @city.name.upcase
    @country.save
    @state.save
    @county.save
    @city.save
    assert_not duplicate_city.valid?
  end

  test "name should not be unique for different states" do
    duplicate_city = @city.dup
    duplicate_city.name = @city.name.upcase
    duplicate_city.county = @county2
    @country.save
    @state.save
    @county2.save
    @city.save
    assert duplicate_city.valid?
  end
end
