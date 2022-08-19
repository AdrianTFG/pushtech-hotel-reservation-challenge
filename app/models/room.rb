class Room < ApplicationRecord
  has_many :reservations, dependent: :restrict_with_exception
end
