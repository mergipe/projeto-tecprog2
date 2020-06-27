class Alimento < ApplicationRecord
  UNIDADE = 1
  PORCAO = 2
  PACOTE = 3

  belongs_to :user

  validates :nome, presence: true
  validates :porcao, presence: true, numericality:
    { greater_than_or_equal_to: 0 }
  validates :unidade, presence: true
  validates :porcoes_pacote, allow_nil: true,
    numericality: { greater_than_or_equal_to: 1 }
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
    return valor_unidade(self.porcao, self.unidade)
  end

  def tamanho_pacote
    return valor_unidade(self.porcoes_pacote, self.unidade)
  end

  def opcoes_porcao
    opcoes = [
      [self.unidade, UNIDADE],
      ['porção (' + self.tamanho_porcao + ')', PORCAO]
    ]

    if self.porcoes_pacote != nil
      opcoes.append(['pacote (' + self.tamanho_pacote + ')', PACOTE])
    end
    
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

  def update_nutrients(quantidade, tipo)
    fator = quantidade.to_f / self.porcao

    if tipo == PORCAO
      fator = quantidade
    elsif tipo == PACOTE
      fator = self.porcoes_pacote.to_f / self.porcao * quantidade
    end

    self.energia *= fator
    self.proteina *= fator
    self.carb_total *= fator
    self.carb_disp *= fator
    self.fibra *= fator
    self.acucar *= fator
    self.gord_total *= fator
    self.gord_sat *= fator
    self.gord_mono *= fator
    self.gord_poli *= fator
    self.gord_trans *= fator
    self.colesterol *= fator
    self.sodio *= fator
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
