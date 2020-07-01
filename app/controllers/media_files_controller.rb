class MediaFilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @media_files = MediaFile.order(:name)
  end

  def show
    @media_file = find_media_file
  end

  def new
    @media_file = MediaFile.new
  end

  def create
    @media_file = MediaFile.new(media_file_params)
    if @media_file.save
      redirect_to media_file_path(@media_file), success: "Media File was successfully created."
    else
      render :new
    end
  end

  def edit
    @media_file = find_media_file
  end

  def update
    @media_file = find_media_file
    if @media_file.update(media_file_params)
      redirect_to media_file_path(@media_file), success: "Media File was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @media_file = find_media_file

    @media_file.destroy!
    redirect_to media_files_path, success: "Media File was successfully deleted."

  end

  private

  def find_media_file
    MediaFile.find(params[:id])
  end

  def media_file_params
    params.require(:media_file).permit(:name, :file_path, :media_type_id, {:media_category_ids => []}, :comment)
  end
end
