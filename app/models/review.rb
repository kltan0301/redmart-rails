class Review < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :product, dependent: :destroy
  
  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :product_id, presence: true
end
