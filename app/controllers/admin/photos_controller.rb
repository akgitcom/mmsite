class Admin::PhotosController < Admin::ApplicationController

  def create
    @photo = Photo.new(photo_params)
    @photo.save
  end
  def edit
    @photo = Photo.find_by(id: params[:id])
  end
  def update
    @photo = Photo.find_by(id: params[:id])
    if @photo.update(photo_params)
      flash[:notice] = "Photo has been updated."
      redirect_to [:admin, @photo]
    else
      render "edit"
    end
  end
  def show
    @photo = Photo.find_by(id: params[:id])
  end
  private
  def photo_params
    params.require(:photo).permit(
        :image,
        :sort
    )
  end
end