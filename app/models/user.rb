class User < ApplicationRecord
  validates :auth_id, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
end
