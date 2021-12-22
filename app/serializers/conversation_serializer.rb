class ConversationSerializer < ApplicationSerializer
    attributes :id, :first_user_id, :second_user_id
    has_many :messages, each_serializer: MessageSerializer
end