class MediaTypesController < ApplicationController
  before_action :authenticate_user!

  def index
    @media_types = MediaType.order(:name)
  end

  def show
    @media_type = find_media_type
  end

  def new
    @media_type = MediaType.new
  end

  def create
    @media_type = MediaType.new(media_type_params)
    if @media_type.save
      redirect_to media_type_path(@media_type), success: "Media Type was successfully created."
    else
      render :new
    end
  end

  def edit
    @media_type = find_media_type
  end

  def update
    @media_type = find_media_type
    if @media_type.update(media_type_params)
      redirect_to media_type_path(@media_type), success: "Media Type was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @media_type = find_media_type

    @media_type.destroy!
    redirect_to media_types_path, success: "Media Type was successfully deleted."

  end

  private

  def find_media_type
    MediaType.find(params[:id])
  end

  def media_type_params
    params.require(:media_type).permit(:name)
  end
end
