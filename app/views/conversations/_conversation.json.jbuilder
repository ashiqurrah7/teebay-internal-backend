json.extract! conversation, :id, :first_user_id_id, :second_user_id_id, :created_at, :updated_at
json.url conversation_url(conversation, format: :json)
