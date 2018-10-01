require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  
  def setup
    @taylor = admins(:taylor)
  end

  test "should be valid" do
    assert @taylor.valid?
  end

  test "should require username" do
    @taylor.name = nil
    assert_not @taylor.valid?
  end

  test "should require password" do
    @taylor.password = nil
    assert_not @taylor.valid?
  end
end
