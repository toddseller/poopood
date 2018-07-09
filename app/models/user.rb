class User < ApplicationRecord
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  has_secure_token :confirmation_token
  has_secure_token :unsubscribe_token

  def validate_email
    self.confirmed = true
    self.confirmation_token = nil
  end
end
