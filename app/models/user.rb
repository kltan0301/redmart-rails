class User < ApplicationRecord
  has_many :reviews
  has_many :products, through: :reviews

  # VALIDATION
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  before_save { self.email = email.downcase }
  
  #Ensure field validity
  validates :name,
            presence: true,
            length: { maximum: 50, message: 'The name is too long' }
  validates :email,
            presence: true,
            length: { maximum: 50 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
end
