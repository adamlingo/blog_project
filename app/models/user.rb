class User < ActiveRecord::Base
  # validates method, same as validates(:name, presence: true)
  validates :name, presence: true
  validates :email, presence: true
end
