class User < ActiveRecord::Base
  # validates method, same as validates(:name, presence: true)
  validates :name, presence: true
  # valid e-mail REGEX, or regular expression defined as a CONSTANT
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX}
end
