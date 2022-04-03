class UserSerializer < ActiveModel::Serializer
  attributes :name, :image, :email, :uid
end
