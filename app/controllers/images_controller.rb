class ImagesController < ApplicationController
  def index
    @images = Image.all.order(created_at: :desc)
    @images = @images.tagged_with(params[:tag]) if params[:tag]
  end

  def new
    @image = Image.new
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    redirect_to images_path
  end

  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to @image
    else
      render 'new'
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  private

  def image_params
    params.require(:image).permit(:url, :tag_list)
  end
end
