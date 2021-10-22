class GenreDetailSerializer < ActiveModel::Serializer
  attributes :id, :name, :image
  has_many :movies
end
