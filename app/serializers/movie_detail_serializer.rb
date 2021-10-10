class MovieDetailSerializer < ActiveModel::Serializer
  attributes :title, :image, :qualification, :realese
  has_one :genre
  has_many :characters
end
