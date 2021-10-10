class GenreDetailSerializer < ActiveModel::Serializer
  attributes :name, :image
  has_many :movies
end
