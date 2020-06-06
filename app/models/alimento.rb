class Alimento < ApplicationRecord
  validates :nome, presence: true
  validates :porcao, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :unidade, presence: true
  validates :porcoes_pacote, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :energia, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :proteina, numericality: { greater_than_or_equal_to: 0 }
  validates :carb_total, numericality: { greater_than_or_equal_to: 0 }
  validates :carb_disp, numericality: { greater_than_or_equal_to: 0 }
  validates :fibra, numericality: { greater_than_or_equal_to: 0 }
  validates :acucar, numericality: { greater_than_or_equal_to: 0 }
  validates :gord_total, numericality: { greater_than_or_equal_to: 0 }
  validates :gord_sat, numericality: { greater_than_or_equal_to: 0 }
  validates :gord_mono, numericality: { greater_than_or_equal_to: 0 }
  validates :gord_poli, numericality: { greater_than_or_equal_to: 0 }
  validates :gord_trans, numericality: { greater_than_or_equal_to: 0 }
  validates :colesterol, numericality: { greater_than_or_equal_to: 0 }
  validates :sodio, numericality: { greater_than_or_equal_to: 0 }

  def nome_completo
    if self.marca.empty?
      return self.nome
    else
      return self.nome + ' (' + self.marca + ')'
    end
  end
end
