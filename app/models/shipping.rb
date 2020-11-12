class Shipping < ApplicationRecord

  belongs_to :enduser

  with_options presence: true do
  validates :postal_code
  validates :address
  validates :name
  end

  def full_address
    '〒' + postal_code + ' ' + address + ' ' + name + ' ' + ' '
  end
end
