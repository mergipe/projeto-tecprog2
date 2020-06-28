class Alimento < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :medidas
  accepts_nested_attributes_for :medidas

  validates :nome, presence: true
  validates :energia, presence: true, numericality:
    { greater_than_or_equal_to: 0 }
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
    return valor_unidade(self.medidas.first.quantidade, self.medidas.first.unidade)
  end

  def opcoes_porcao
    opcoes = []
    self.medidas.each_with_index { |m, i| opcoes.append(m.unidade) }
    return opcoes
  end

  def marca_porcao
    texto = ''

    if not self.marca.empty?
      texto += self.marca + ', '
    end

    texto += self.tamanho_porcao
    return texto
  end

  def energia_kcal
    return valor_unidade(self.energia, 'kcal')
  end

  def proteina_g
    return valor_unidade(self.proteina, 'g')
  end

  def carb_total_g
    return valor_unidade(self.carb_total, 'g')
  end

  def gord_total_g
    return valor_unidade(self.gord_total, 'g')
  end

  def fibra_g
    return valor_unidade(self.fibra, 'g')
  end

  def self.search(search)
    if search
      where('nome LIKE ?', "%#{search}%")
    else
      where(nil)
    end
  end

  private
    def valor_unidade(valor, unidade)
      return valor.to_s + ' ' + unidade
    end
end
