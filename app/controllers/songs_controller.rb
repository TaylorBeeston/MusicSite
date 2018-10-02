class SongsController < ApplicationController

  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]

  def show
    @song = Song.find(params[:id]) 
  end

  def index
    if params[:album].nil?
      if params[:tags].nil?
        @songs = Song.asc_sort
        @tags = Song.tag_counts
      else
        @songs = Song.tagged(params[:tags])
        @tags = Song.tagged_with(params[:tags]).tag_counts
        # Remove already selected tags from tag list
        params[:tags].each do |tag|
          @tags = @tags.where.not(name: tag)
        end
      end
    else
      @songs = Song.album_tag(params[:album])
    end
    @albums = Song.tag_counts_on(:albums)
  end

  def new
    @song = Song.new
    @btext = "Post"
    @titleText = "New Song"
  end

  def create
    @song = Song.new(song_params)
    @song.picture = default_picture unless @song.picture?
    if @song.save
      redirect_to root_url
    else
      redirect_to 'new'
    end
  end

  def edit
    @song = Song.find(params[:id])
    @btext = "Update"
    @titleText = "Edit Song"
  end

  def update
    @song = Song.find(params[:id])
    if @song.update_attributes(song_params)
      flash[:success] = "Song updated"
      redirect_to menu_path
    else
      render 'edit'
    end
  end

  def destroy
    Song.find(params[:id]).destroy
    flash[:success] = "Song deleted"
    redirect_to songs_url
  end

  def play
    @song = Song.find(params[:id]) 
    respond_to do |format|
      format.html 
      format.js
    end
  end

  private

    def default_picture
      File.open("app/assets/images/default.jpg")
    end
    
    def song_params
      params.require(:song).permit(:song, :name, :bio, :picture, :tag_list,
                                   :album_list, :num)
    end

end
