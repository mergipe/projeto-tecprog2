class Medida < ApplicationRecord
  validates :quantidade, presence: true, numericality:
    { greather_than_or_equal_to: 0 }
  validates :unidade, presence: true
end
