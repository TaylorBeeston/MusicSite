require 'test_helper'

class SongTest < ActiveSupport::TestCase

  def setup
    @cedar = songs(:cedar)
  end

  test "should be valid" do
    assert @cedar.valid?
  end

  test "should require name" do
    @cedar.name = nil
    assert_not @cedar.valid?
  end
  
  test "should require artist" do
    @cedar.artist = nil
    assert_not @cedar.valid?
  end

  test "should not require album or order" do
    @cedar.album_list = nil
    @cedar.num = nil
    assert @cedar.valid?
  end

end
