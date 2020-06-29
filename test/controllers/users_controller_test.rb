require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get delete" do
    get users_delete_url
    assert_response :success
  end

end
