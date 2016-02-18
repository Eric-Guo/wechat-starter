require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test 'should get index' do
    user = User.first
    sign_in user
    get :index
    assert_response :success
  end
end
