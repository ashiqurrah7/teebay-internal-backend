class UserSerializer < ApplicationSerializer
    attributes :id, :email
    has_many :products, each_serializer: ProductSerializer
end