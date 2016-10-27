class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :name, :hometown
  has_many :posts
end
