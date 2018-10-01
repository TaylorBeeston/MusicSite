require 'test_helper'

class MenuControllerTest < ActionDispatch::IntegrationTest

  def setup
    @taylor = admins(:taylor)
    @burp  = songs(:burp)
  end

  test "should get index only if logged in" do
    get menu_path
    assert_redirected_to login_path
    post login_path, params: { 
                     session: { name: 'taylor', password: 'foobar' } }
    get menu_path
    assert :success
  end

end
