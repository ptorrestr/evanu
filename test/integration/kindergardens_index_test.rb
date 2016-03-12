require 'test_helper'

class KindergardensIndexTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:pablo)
    @nutritionist = users(:gloria)
    @default = users(:kiki)
  end

  test "index including pagination" do
    log_in_as(@admin)
    get kindergardens_path
    assert_template 'kindergardens/index'
    assert_select 'div.pagination'
    first_page_of_kindergardens = Kindergarden.paginate(page: 1)
    first_page_of_kindergardens.each do |kindergarden|
      assert_select 'a[href=?]', kindergarden_path(kindergarden), text: kindergarden.name
    end
  end

  test "index should display only user-owned kindergardens" do
    log_in_as(@nutritionist)
    get kindergardens_path
    assert_template 'kindergardens/index'
    first_page_of_kindergardens = Kindergarden.where(user_id: @nutritionist.id)
    first_page_of_kindergardens.each do |kindergarden|
      assert_select 'a[href=?]', kindergarden_path(kindergarden), text: kindergarden.name
    end
  end

  test "should not display index for non-login user" do
    get kindergardens_path
    assert_not flash.empty?
  end
end
