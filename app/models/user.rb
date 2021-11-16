class User < ApplicationRecord
    has_many :access_grants,
        class_name: 'Doorkeeper::AccessGrant',
        foreign_key: :resource_owner_id,
        dependent: :delete_all

    has_many :access_tokens,
        class_name: 'Doorkeeper::AccessToken',
        foreign_key: :resource_owner_id,
        dependent: :delete_all
    
    has_many :products
    has_many :messages
    
    has_many :firstUser_conversations, class_name: 'Conversation', foreign_key: 'firstUser_id'
    has_many :secondUser_conversations, class_name: 'Conversation', foreign_key: 'secondUser_id'
    
    has_secure_password
    validates :email, presence: true
    validates :password, presence: true

end
