class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content
  has_one :author, serializer: PostAuthorSerializer
  has_many :comments
end
