class MovieDetailSerializer < ActiveModel::Serializer
  attributes :id, :title, :image, :qualification, :realese
  has_one :genre
  has_many :characters
end
