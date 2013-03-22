require 'test_helper'

class IpControllerTest < ActionController::TestCase
  test "should get add" do
    get :add
    assert_response :success
  end

  test "should get get" do
    get :get
    assert_response :success
  end

  test "should get all" do
    get :all
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

end
