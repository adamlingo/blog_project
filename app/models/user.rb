class User < ActiveRecord::Base
  # callback before record is saved, indicating lowercase conversion
  before_save { email.downcase! }
  # validates method, same as validates(:name, presence: true)
  validates :name, presence: true
  # valid e-mail REGEX, or regular expression defined as a CONSTANT
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # uniqueness is inferred as true, but you can set case sensitivity
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
              uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
