class ProductSerializer < ApplicationSerializer
    attributes :id, :user_id, :title, :desc, :price
    has_many :categories, each_serializer: CategorySerializer
end