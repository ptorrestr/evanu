require 'test_helper'

class CountryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @country = Country.new(name: "France") 
  end

  test "should be valid" do
    assert @country.valid?
  end

  test "name should be present" do
    @country.name = ""
    assert_not @country.valid?
  end

  test "name should be unique" do
    duplicate_country = @country.dup
    duplicate_country.name = @country.name.upcase
    @country.save
    assert_not duplicate_country.valid?
  end
end
