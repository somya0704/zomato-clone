require 'test_helper'

class StaffsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get staffs_create_url
    assert_response :success
  end

end
