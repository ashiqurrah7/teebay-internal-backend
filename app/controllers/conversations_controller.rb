class ConversationsController < ApplicationController
  before_action :set_conversation, only: %i[ show edit update destroy ]

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
    conversation = Conversation.new({**conversation_params, first_user_id: current_user.id})
    created_conversation = conversation.save
    if created_product
      render json: ConversationSerializer.new.serialize_to_json(conversation), status: :ok
    else
      render json: {message: "Error creating chat room", data: conversation.errors}, status: :bad_request
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
      @conversation = Conversation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def conversation_params
      params.require(:conversation).permit(:second_user_id_id)
    end
end
