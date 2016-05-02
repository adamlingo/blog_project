require "test_helper"

class PagesControllerTest < ActionController::TestCase
  def test_home
    get :home
    assert_response :success
  end

  def test_help
    get :help
    assert_response :success
  end

  def test_about
    get :about
    assert_response :success
  end
  
end
