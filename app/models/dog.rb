class Dog < ApplicationRecord
 belongs_to :owner
 belongs_to :breed
 validates :name, presence: true, length: {minimum: 2}
end
