class Owner < ApplicationRecord
 has_many :dogs
 validates :name, presence: true, length: {minimum: 2}
end
