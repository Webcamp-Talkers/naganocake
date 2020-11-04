class Genre < ApplicationRecord
  
    has_many :enduser
    belongs_to :item
    validates :name, presence: true

end
