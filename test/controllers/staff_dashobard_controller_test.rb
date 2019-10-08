require 'test_helper'

class StaffDashobardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get staff_dashobard_index_url
    assert_response :success
  end

end
