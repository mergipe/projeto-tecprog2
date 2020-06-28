class Alimento < ApplicationRecord
  belongs_to :user
  has_many :porcoes_referencia, class_name: 'PorcaoReferencia',
    dependent: :destroy
  accepts_nested_attributes_for :porcoes_referencia

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

  def porcao_referencia
    return self.porcoes_referencia.first.quantidade.to_s + ' ' +
           self.porcoes_referencia.first.unidade
  end

  def opcoes_porcao
    opcoes = []
    self.porcoes_referencia.each_with_index { |p, i| opcoes.append(p.unidade) }
    return opcoes
  end

  def marca_porcao
    texto = ''

    if not self.marca.empty?
      texto += self.marca + ', '
    end

    texto += self.porcao_referencia
    return texto
  end

  def energia_porcao(quantidade, unidade)
    return nutriente_porcao(self.energia, quantidade, unidade)
  end

  def proteina_porcao(quantidade, unidade)
    return nutriente_porcao(self.proteina, quantidade, unidade)
  end

  def carb_total_porcao(quantidade, unidade)
    return nutriente_porcao(self.carb_total, quantidade, unidade)
  end

  def carb_disp_porcao(quantidade, unidade)
    return nutriente_porcao(self.carb_disp, quantidade, unidade)
  end

  def fibra_porcao(quantidade, unidade)
    return nutriente_porcao(self.fibra, quantidade, unidade)
  end

  def acucar_porcao(quantidade, unidade)
    return nutriente_porcao(self.acucar, quantidade, unidade)
  end

  def gord_total_porcao(quantidade, unidade)
    return nutriente_porcao(self.gord_total, quantidade, unidade)
  end

  def gord_sat_porcao(quantidade, unidade)
    return nutriente_porcao(self.gord_sat, quantidade, unidade)
  end

  def gord_mono_porcao(quantidade, unidade)
    return nutriente_porcao(self.gord_mono, quantidade, unidade)
  end

  def gord_poli_porcao(quantidade, unidade)
    return nutriente_porcao(self.gord_poli, quantidade, unidade)
  end

  def gord_trans_porcao(quantidade, unidade)
    return nutriente_porcao(self.gord_trans, quantidade, unidade)
  end

  def colesterol_porcao(quantidade, unidade)
    return nutriente_porcao(self.colesterol, quantidade, unidade)
  end

  def sodio_porcao(quantidade, unidade)
    return nutriente_porcao(self.sodio, quantidade, unidade)
  end

  def self.search(search)
    if search
      where('nome LIKE ?', "%#{search}%")
    else
      where(nil)
    end
  end

  private
    def nutriente_porcao(attr, quantidade, unidade)
      porcao_ref = self.porcoes_referencia.where('unidade=?', unidade).first
      return attr * quantidade.to_f / porcao_ref.quantidade
    end
end
