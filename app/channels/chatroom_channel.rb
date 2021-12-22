class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    @room = Conversation.find(params[:room])
    stream_for @room
  end

  def create_message(data)
        token = Doorkeeper::AccessToken.find_by_token(data["token"])
        current_user = User.find(token[:resource_owner_id])
        message = Message.new(text: data["text"], conversation_id:@room.id, user_id: current_user.id)
        created_message = message.save
        conversation = Conversation.find(@room.id)
        if created_message
          ChatroomChannel.broadcast_to(
            @room, {
              messages: Panko::ArraySerializer.new(conversation.messages, each_serializer: MessageSerializer).to_json
            }
          )
        end
  end
  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
