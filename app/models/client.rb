class Client < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable,
          :jwt_authenticatable,
          :registerable,
          :recoverable, 
          :rememberable, 
          :validatable,
          jwt_revocation_strategy: JwtDenylist
  self.skip_session_storage = [:http_auth, :params_auth]
  belongs_to :market
  belongs_to :business_type
  has_many :leads
end
