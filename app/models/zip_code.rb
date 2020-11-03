class ZipCode < ApplicationRecord
  belongs_to :town
  scope :search, -> (zip) {where("zip ilike ?", "#{zip}%").limit(4)}
end
