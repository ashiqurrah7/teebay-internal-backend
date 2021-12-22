class ApplicationController < ActionController::API
    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    rescue_from NoMethodError, with: :user_not_authorized

    def user_not_authorized(exception)
    render json: {message: "You are not authorized to perform this action"}, status: :forbidden
    end

    helper_method :current_user
    def current_user
        @current_user ||= User.find_by id: doorkeeper_token[:resource_owner_id]
    end
end