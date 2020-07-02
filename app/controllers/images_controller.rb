class ImagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @images = Image.order(:name)
  end

  def show
    @image = find_image
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to image_path(@image), success: "Image was successfully created."
    else
      render :new
    end
  end

  def edit
    @image = find_image
  end

  def update
    @image = find_image
    if @image.update(image_params)
      redirect_to image_path(@image), success: "Image was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @image = find_image

    if !@image.media_files.exists?
      @image.destroy!
      redirect_to images_path, success: "Image was successfully deleted."
    else
      redirect_to images_path, error: "Image cannot be deleted when associated media file exists"
    end
  end

  private

  def find_image
    Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:name, :file_path)
  end
end
