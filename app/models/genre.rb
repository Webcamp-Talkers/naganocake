class Genre < ApplicationRecord

    has_many :enduser

    validates :name, presence: true

end
