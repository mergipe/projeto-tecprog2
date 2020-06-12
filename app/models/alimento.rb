class Alimento < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :refeicoes

  validates :nome, presence: true
  validates :porcao, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :unidade, presence: true
  validates :porcoes_pacote, allow_nil:true, numericality: { greater_than_or_equal_to: 1 }
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

  def tamanho_porcao
    return value_unidade(self.porcao, self.unidade)
  end

  def energia_kcal
    return value_unidade(self.energia, 'kcal')
  end

  def proteina_g
    return value_unidade(self.proteina, 'g')
  end

  def carb_total_g
    return value_unidade(self.carb_total, 'g')
  end

  def gord_total_g
    return value_unidade(self.gord_total, 'g')
  end

  def fibra_g
    return value_unidade(self.fibra, 'g')
  end

  private
    def value_unidade(value, unidade)
      return value.to_s + ' ' + unidade
    end
end
