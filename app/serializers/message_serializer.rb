class MessageSerializer < Panko::Serializer
    attributes :id, :text, :user_id ,:created_at
end