class PhotosController < ApplicationController
  before_action :authenticate_request
  before_action :set_photo, only: [:show, :update, :destroy]

  # GET /photos
  def index
    @photos = Photo.all
    render json: @photos
  end

  # GET /photos/#
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
        photo_ready = photo_serialized.new_photo_serial
        url_to_save = JSON.parse(photo_ready)["photo"]["url"]
        @photo.update(url: url_to_save)
        render json: photo_ready, status: 200
      else
        render json: {"error": "Something went wrong when trying upload your picture, try with another and don't forget add a caption for it."}, status: 400
      end
    end

  private def set_photo
      @photo = Photo.find(params[:id])
    end

end