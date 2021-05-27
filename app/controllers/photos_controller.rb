class PhotosController < ApplicationController

  def create
    @photo = Photo.create(photo_params())
    respond_to_photo
  end

  private def photo_params
      params.permit(:image)
    end

  private def respond_to_photo
      if @photo.valid?
        photo_serialized = PhotoSerial.new(photo: @photo)
        render json: photo_serialized.new_photo_serial, status: 200
      else
        render json: {}, status: 400
      end
    end


end