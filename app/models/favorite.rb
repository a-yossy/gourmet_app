class Favorite < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :restaurant_name, presence: true
  validates :restaurant_address, uniqueness: { scope: [:user_id, :restaurant_name] }
end
