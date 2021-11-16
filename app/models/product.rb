class Product < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :categories
    validates :user_id, presence: true
    validates :title, presence: true
    validates :desc, presence: true
    validates :price, presence: true
end
