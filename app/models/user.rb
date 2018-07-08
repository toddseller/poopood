class User < ApplicationRecord

  has_secure_token :confirmation_token
  
end
