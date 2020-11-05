class Genre < ApplicationRecord
<<<<<<< HEAD

    has_many :enduser
=======
  
    has_many :items
>>>>>>> origin/develop

    validates :name, presence: true

end
