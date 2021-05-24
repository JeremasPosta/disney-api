class PhotosController < ApplicationController

  def create
    @user = get_current_user()
    params[:user_id] = @user.id

    @photo = Photo.create(photo_params())
    respond_to_photo()
  end

  private def photo_params
    params.permit(:user_id, :caption, :image)
  end

  private def respond_to_photo()
    if @photo.valid?()
      photo_serializer = PostSerializer.new(photo: @photo, user: @user)
      render json: photo_serializer.serialize_new_photo()
    else
      render json: { errors: photo.errors }, status: 400
    end
  end

end