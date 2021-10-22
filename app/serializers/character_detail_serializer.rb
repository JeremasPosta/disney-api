class CharacterDetailSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :age, :weight, :history
  has_many :movies
end
