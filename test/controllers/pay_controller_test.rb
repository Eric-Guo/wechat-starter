require 'test_helper'

class PayControllerTest < ActionController::TestCase
  test 'should get index' do
    user = User.first
    sign_in user
    post :wx_pay, xhr: true
    assert_response :success
    assert_equal 'application/json', @response.content_type
  end
end
