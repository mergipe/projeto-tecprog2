class Registro < ApplicationRecord
  belongs_to :alimento
  belongs_to :refeicao

  validates :porcao, presence: true, numericality:
    { greater_than_or_equals_to: 0 }
end
