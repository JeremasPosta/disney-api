class PhotoSerial < ApplicationController

  def initialize(photo: nil)
    @photo = photo
  end

  def new_photo_serial
    serialize_photo(@photo).to_json()
  end

  private def serialize_photo(photo)
    {
      photo: {
        id: photo.id,
        image_url: photo.get_image_url(),
        caption: photo.caption
      }
    }
  end
  
end