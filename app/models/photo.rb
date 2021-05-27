class Photo < ApplicationRecord
  include Rails.application.routes.url_helpers
  has_one_attached :image
  validates :image, presence: true
  #validates :caption, presence: true, length: {minimum: 1}
  
  def get_image_url
    url_for(self.image)
  end

end
