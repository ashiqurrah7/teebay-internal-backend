class ConversationsController < ApplicationController

  # GET /conversations or /conversations.json
  def index
    conversations = Conversation.order('created_at DESC')
    render json: Panko::ArraySerializer.new(conversations, each_serializer: ConversationSerializer).to_json, status: :ok
  end

  # GET /conversations/1 or /conversations/1.json
  def show
    conversation = Conversation.find(params[:id])
    render json: ConversationSerializer.new.serialize_to_json(conversation), status: :ok
  end

  # POST /conversations or /conversations.json
  def create
    if current_user
      conversation = Conversation.where(first_user_id: current_user.id, second_user_id: conversation_params[:second_user_id]).first
      if !conversation
        conversation = Conversation.new({**conversation_params, first_user_id: current_user.id})
        created_conversation = conversation.save
        if created_conversation
          render json: ConversationSerializer.new.serialize_to_json(conversation), status: :ok
        else
          render json: {message: "Error creating chat room", data: created_conversation.errors}, status: :bad_request
        end
      else
        render json: ConversationSerializer.new.serialize_to_json(conversation), status: :ok
      end
    else
      render json: {message: "You are not authorized to perform this action"}, status: :forbidden
    end
  end


  private
    # Only allow a list of trusted parameters through.
    def conversation_params
      params.require(:conversation).permit(:second_user_id)
    end
end
