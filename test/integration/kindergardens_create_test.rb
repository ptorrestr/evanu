require 'test_helper'

class KindergardensCreateTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:pablo)
    @default = users(:kiki)
    @santiago = cities(:santiagocentro)
  end

  test "annonymous user attempt to create a kindergarden" do
    get new_kindergarden_path
    assert_no_difference 'Kindergarden.count' do
      post kindergardens_path, kindergarden: { name: "",
                                  phone: "123",
                                  city_id: @santiago.id}
    end
    assert_not flash.empty?
  end

  test "invalid creation of a kindergarden" do
    log_in_as(@admin)
    get new_kindergarden_path
    assert_no_difference 'Kindergarden.count' do
      post kindergardens_path, kindergarden: { name: "",
                                               phone: "",
                                               city_id: @santiago.id }
      assert_template 'kindergardens/new'
    end
  end

  test "no permission for creating a kindergarden" do
    log_in_as(@default)
    assert_no_difference 'Kindergarden.count' do
      post kindergardens_path, kindergarden: { name: "valid",
                                               phone: "123",
                                               city_id: @santiago.id}
    end
    assert_not flash.empty?
  end

  test "valid creation for a kindergarden" do
    log_in_as(@admin)
    assert_difference 'Kindergarden.count', 1 do
      post kindergardens_path, kindergarden: { name: "valid",
                                               phone: "123",
                                               city_id: @santiago.id}
    end
  end

end
