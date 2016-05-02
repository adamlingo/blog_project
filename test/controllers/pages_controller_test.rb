require "test_helper"

class PagesControllerTest < ActionController::TestCase
  # "setup" is run before each test automatically
  def setup
    @base_title = "Ruby Blog Tutorial"
  end

  def test_home
    get :home
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  def test_help
    get :help
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  def test_about
    get :about
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

end
