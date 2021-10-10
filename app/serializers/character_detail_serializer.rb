class CharacterDetailSerializer < ActiveModel::Serializer
  attributes :name, :image, :age, :weight, :history
  has_many :movies
end
