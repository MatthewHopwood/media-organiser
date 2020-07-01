class PlaylistsController < ApplicationController
  before_action :authenticate_user!

  def index
    @playlists = Playlist.order(:name)
  end

  def show
    @playlist = find_playlist
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new(playlist_params)
    if @playlist.save
      redirect_to playlist_path(@playlist), success: "Playlist was successfully created."
    else
      render :new
    end
  end

  def edit
    @playlist = find_playlist
  end

  def update
    @playlist = find_playlist
    if @playlist.update(playlist_params)
      redirect_to playlist_path(@playlist), success: "Playlist was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @playlist = find_playlist

    @playlist.destroy!
    redirect_to root_path, success: "Playlist was successfully deleted."

  end

  private

  def find_playlist
    Playlist.find(params[:id])
  end

  def playlist_params
    params.require(:playlist).permit(:name)
  end
end
