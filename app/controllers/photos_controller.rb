class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :update, :destroy]

  # GET /photos
  def index
    @photos = Photo.all
    render json: @photos
  end

  # GET /photos/1
  def show
    render json: @photo
  end


  def create
    @photo = Photo.create(photo_params)
    respond_to_photo
  end

  private def photo_params
      params.permit(:image, :caption)
    end

  private def respond_to_photo
      if @photo.valid?
        photo_serialized = PhotoSerial.new(photo: @photo)
        render json: photo_serialized.new_photo_serial, status: 200
      else
        render json: {"error": "Something went wrong when trying upload your picture, try with another and don't forget add a caption for it."}, status: 400
      end
    end

  private  def set_photo
      @photo = Photo.find(params[:id])
    end

end