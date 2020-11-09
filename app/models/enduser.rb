class Enduser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shippings, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy

  with_options presence: true do
  validates :first_name
  validates :last_name
  validates :first_furigana
  validates :last_furigana
  validates :phone_number
  validates :postal_code
  validates :address
  end


  def active_for_authentication?
    super && (self.costomer_status == true)
  end

end
