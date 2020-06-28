class Medida < ApplicationRecord
  validates :quantidade, presence: true, numericality:
    { greater_than: 0 }
  validates :unidade, presence: true
end
