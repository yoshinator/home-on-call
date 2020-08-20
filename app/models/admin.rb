class Admin < ApplicationRecord
  has_secure_password
  before_save :check_privilige

  validates :password, length: { minimum: 9, allow_blank: true }
  validates :email, presence: true,
            format: { with: /\S+@\S+\.\S+/ },
            uniqueness: {case_sensitive: false}

  private 
  def check_privilige
    if self.super 
      self.client_access = true 
      self.edit_access = true
    end 
  end 

end
