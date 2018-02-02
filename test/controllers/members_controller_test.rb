require 'test_helper'

class MembersControllerTest < ActionDispatch::IntegrationTest
  test "should render index" do
    get members_path
    assert_response :success
  end

  test "should render new" do
    get new_member_path
    assert_response :success
  end
end
