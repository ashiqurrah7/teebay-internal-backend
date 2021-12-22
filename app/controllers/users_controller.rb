class UsersController < ApplicationController

  # GET /user/me
  def me
    if current_user
      user = current_user
      render json: UserSerializer.new.serialize_to_json(user), status: :ok
    else
      render json: {message: "User not logged in"}, status: :forbidden
    end
  end

  # POST /users or /users.json
  def create
    user = User.new(user_params)
    created_user = user.save
    if created_user
        render json: UserSerializer.new.serialize_to_json(user), status: :ok
      else
        render json: {message: "Error creating user", data: created_user.errors}, status: :bad_request
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:email, :password)
    end
end
