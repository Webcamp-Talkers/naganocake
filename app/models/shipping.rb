class Shipping < ApplicationRecord
  
  belongs_to :enduser
  
  with_options presence: true do
  validates :postal_code
  validates :address
  validates :name
  end
  
end
