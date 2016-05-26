class User < ActiveRecord::Base
  attr_accessor :remember_token
  # callback before record is saved, indicating lowercase conversion
  before_save { email.downcase! }
  # validates method, same as validates(:name, presence: true)
  validates :name, presence: true
  # valid e-mail REGEX, or regular expression defined as a CONSTANT
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  # uniqueness is inferred as true, but you can set case sensitivity
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
              uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Return random token: Remembering users involves creating a 
  # remember token and saving the digest of the token to the database.
  # "SecureRandom" module is in Ruby's standard library
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers users in db for use in sessions that are persistent
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forget (opposite of remember) user by updating remember digest w/nil
  def forget
    update_attribute(:remember_digest, nil)
  end
end
