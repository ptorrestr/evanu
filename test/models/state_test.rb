require 'test_helper'

class StateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @country = Country.new(name: "Ireland")
    @country2 = Country.new(name: "England")
    @state = State.new(name: "Galway",
		       country: @country)
  end
 
  test "should be valid" do
    assert @state.valid?
  end

  test "name should be present" do
    @state.name = ""
    assert_not @state.valid?
  end

  test "name should be unique for a country" do
    duplicate_state = @state.dup
    duplicate_state.name = @state.name.upcase
    @country.save
    @state.save
    assert_not duplicate_state.valid?
  end

  test "name should not be unique for different countries" do
    duplicate_state = @state.dup
    duplicate_state.name = @state.name.upcase
    duplicate_state.country = @country2
    @country2.save
    @state.save
    assert duplicate_state.valid?
  end
end
