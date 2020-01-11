class Admin < ApplicationRecord
  has_secure_password

  validates :password, length: { minimum: 9, allow_blank: true }
  validates :email, presence: true,
            format: { with: /\S+@\S+\.\S+/ },
            uniqueness: {case_sensitive: false}
end
