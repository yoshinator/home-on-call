class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_save :check_privilige

  # validates :password, length: { minimum: 9, allow_blank: true }
  validates :email, presence: true,
            format: { with: /\S+@\S+\.\S+/ },
            uniqueness: {case_sensitive: false}

  def full_name
    "#{self.fname } #{self.lname}"
  end

  private 
  def check_privilige
    if self.super 
      self.client_access = true 
      self.edit_access = true
    end 
  end 

end
