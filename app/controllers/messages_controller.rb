class MessagesController < ApplicationController
  # GET /messages or /messages.json
  def index
    messages = Message.order('created_at DESC')
    render json: Panko::ArraySerializer.new(products, each_serializer: MessageSerializer).to_json, status: :ok
  end


  # POST /messages or /messages.json
  def create
    message = Message.new(message_params)
      if current_user
        message = Message.new({**message_params, user_id:current_user.id})
        conversation = Conversation.find(message_params[:conversation_id])
        created_message = message.save
        if created_message
          render json: MessageSerializer.new.serialize_to_json(message), status: :ok
        else
          render json: {message: "Error creating product", data: product.errors}, status: :bad_request
        end
        render json: {message: "You are not authorized to perform this action"}, status: :forbidden
      end
  end

  private
    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:conversation_id,:text)
    end
end
