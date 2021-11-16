class CategorySerializer < Panko::Serializer
    attributes :name
end

class ProductSerializer < Panko::Serializer
    attributes :id, :user_id, :title, :desc, :price
    has_many :categories, each_serializer: CategorySerializer
end

class MessageSerializer < Panko::Serializer
    attributes :id, :text, :user_id ,:created_at
end

class ConversationSerializer < Panko::Serializer
    attributes :id, :first_user_id, :second_user_id
    has_many :messages, each_serializer: MessageSerializer
end

class UserSerializer < Panko::Serializer
    attributes :id, :email
    has_many :products, each_serializer: ProductSerializer
    # has_many :conversations, each_serializer: ConversationSerializer
end

class ApplicationController < ActionController::API
    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    # rescue_from NoMethodError, with: :user_not_authorized

    def user_not_authorized(exception)
    render json: {message: "You are not authorized to perform this action"}, status: :forbidden
    end

    helper_method :current_user
    def current_user
        @current_user ||= User.find(doorkeeper_token[:resource_owner_id])
    end
end