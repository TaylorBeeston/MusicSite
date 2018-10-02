require 'test_helper'

class SongsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @burp =  songs(:burp)
    @burp.tag_list = "Sound Effect, Goofy"
    @burp.save

    @cedar = songs(:cedar)
    @cedar.tag_list = "Basses, Long, Jazz"
    @cedar.album_list = "Sample"
    @cedar.save
  end

  test "get index without tags" do
    get root_path
    assert_select 'a[href=?]', login_path
    assert_select '.list-group-item', minimum: 2
    assert_select 'a[href=?]', play_song_path(@burp.id)
    assert_select 'a[href=?]', songs_path(tags: ['Basses'])
    assert_select 'a[href=?]', songs_path(album: 'Sample')
    assert_select '#song-info', text: "Nothing Playing..."
    assert_select '#main_player', src: ''
  end

  test "get index with tags" do
    get root_path(tags: ['Basses', 'Jazz'])
    assert_select '.list-group-item', count: 1
    assert_select 'a[href=?]', play_song_path(@cedar.id)
    assert_select 'a[href=?]', songs_path(tags: ['Jazz']), text: 'Basses (X)'
    assert_select 'a[href=?]', songs_path(tags: ['Basses']), text: 'Jazz (X)'
    assert_select 'a',         text: 'Basses', count: 0
    assert_select 'a[href=?]', songs_path
  end

  test "get index with album" do
    get root_path(album: 'Sample')
    assert_select '.list-group-item', count: 1
    assert_select 'a[href=?]', play_song_path(@cedar.id)
    assert_select 'a[href=?]', songs_path, text: 'Sample'
  end

  test "should redirect create when not logged in" do
    get new_song_path
    assert_redirected_to login_path
    assert_no_difference 'Song.count' do
      post songs_path(name: 'test')
      assert_redirected_to login_path
    end
  end

  test "should redirect edit when not logged in" do
    get edit_song_path(@cedar)
    assert_redirected_to login_path
    patch song_path(@cedar), params: { song: { name: 'foobar' } }
    assert_not_equal @cedar.name, 'foobar'
  end

  test "should redirect delete when not logged in" do
    assert_no_difference 'Song.count' do
      delete song_path(@cedar)
      assert_redirected_to login_path
    end
  end

end
