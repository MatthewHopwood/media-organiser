class MediaCategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @media_categories = MediaCategory.order(:name)
  end

  def show
    @media_category = find_media_category
  end

  def new
    @media_category = MediaCategory.new
  end

  def create
    @media_category = MediaCategory.new(media_category_params)
    if @media_category.save
      redirect_to media_category_path(@media_category), success: "Media Category was successfully created."
    else
      render :new
    end
  end

  def edit
    @media_category = find_media_category
  end

  def update
    @media_category = find_media_category
    if @media_category.update(media_category_params)
      redirect_to media_category_path(@media_category), success: "Media Category was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @media_category = find_media_category

    @media_category.destroy!
    redirect_to media_categories_path, success: "Media Category was successfully deleted."

  end

  private

  def find_media_category
    MediaCategory.find(params[:id])
  end

  def media_category_params
    params.require(:media_category).permit(:name)
  end
end
