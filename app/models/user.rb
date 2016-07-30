class User < ApplicationRecord
  has_many :reviews
  has_many :products, through: :reviews

  #form validity constraints
  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :name,
            presence: true,
            length: { maximum: 50 }

  validates :email,
            presence: true,
            length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX }

  has_secure_password

  validates :password,
            presence: true,
            length: { minimum: 6 }

  validates :cc_number,
            allow_blank: true,
            length: { minimum: 13, maximum: 19, message: 'Credit card number invalid'}

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost

    Bcrypt::Password.create(string, cost: cost)
  end
end
