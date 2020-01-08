class Client < ApplicationRecord
  belongs_to :market
  belongs_to :business_type
end
