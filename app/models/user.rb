class User < ApplicationRecord
  has_secure_password
  has_many :bucket_items
end
