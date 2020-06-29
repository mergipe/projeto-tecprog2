class Registro < ApplicationRecord
  belongs_to :alimento
  belongs_to :refeicao

  validates :quantidade, presence: true, numericality: {greater_than: 0}
  validates :unidade, presence: true

  def self.from_alimento(alimento)
    return self.where('alimento_id=?', alimento.id)
  end
end
