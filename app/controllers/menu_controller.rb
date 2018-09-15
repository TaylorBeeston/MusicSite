class MenuController < ApplicationController
  before_action :logged_in_user
  layout 'menu'

  def index
    @songs = Song.all
  end
end
