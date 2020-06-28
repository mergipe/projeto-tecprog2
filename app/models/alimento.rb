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

  def tamanho_porcao
    return valor_unidade(
      self.porcoes_referencia.first.quantidade,
      self.porcoes_referencia.first.unidade
    )
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

    texto += self.tamanho_porcao
    return texto
  end

  def energia_kcal(quantidade=self.porcoes_referencia.first.quantidade,
                   unidade=self.porcoes_referencia.first.unidade)
    transformado = transforma_valor(self.energia, quantidade, unidade)
    return valor_unidade(transformado, 'kcal')
  end

  def proteina_g(quantidade=self.porcoes_referencia.first.quantidade,
                 unidade=self.porcoes_referencia.first.unidade)
    transformado = transforma_valor(self.proteina, quantidade, unidade)
    return valor_unidade(transformado, 'g')
  end

  def carb_total_g(quantidade=self.porcoes_referencia.first.quantidade,
                   unidade=self.porcoes_referencia.first.unidade)
    transformado = transforma_valor(self.carb_total, quantidade, unidade)
    return valor_unidade(transformado, 'g')
  end

  def carb_disp_g(quantidade=self.porcoes_referencia.first.quantidade,
                  unidade=self.porcoes_referencia.first.unidade)
    transformado = transforma_valor(self.carb_disp, quantidade, unidade)
    return valor_unidade(transformado, 'g')
  end

  def fibra_g(quantidade=self.porcoes_referencia.first.quantidade,
              unidade=self.porcoes_referencia.first.unidade)
    transformado = transforma_valor(self.fibra, quantidade, unidade)
    return valor_unidade(transformado, 'g')
  end

  def acucar_g(quantidade=self.porcoes_referencia.first.quantidade,
               unidade=self.porcoes_referencia.first.unidade)
    transformado = transforma_valor(self.acucar, quantidade, unidade)
    return valor_unidade(transformado, 'g')
  end

  def gord_total_g(quantidade=self.porcoes_referencia.first.quantidade,
                   unidade=self.porcoes_referencia.first.unidade)
    transformado = transforma_valor(self.gord_total, quantidade, unidade)
    return valor_unidade(transformado, 'g')
  end

  def gord_sat_g(quantidade=self.porcoes_referencia.first.quantidade,
                 unidade=self.porcoes_referencia.first.unidade)
    transformado = transforma_valor(self.gord_sat, quantidade, unidade)
    return valor_unidade(transformado, 'g')
  end

  def gord_mono_g(quantidade=self.porcoes_referencia.first.quantidade,
                  unidade=self.porcoes_referencia.first.unidade)
    transformado = transforma_valor(self.gord_mono, quantidade, unidade)
    return valor_unidade(transformado, 'g')
  end

  def gord_poli_g(quantidade=self.porcoes_referencia.first.quantidade,
                  unidade=self.porcoes_referencia.first.unidade)
    transformado = transforma_valor(self.gord_poli, quantidade, unidade)
    return valor_unidade(transformado, 'g')
  end

  def gord_trans_g(quantidade=self.porcoes_referencia.first.quantidade,
                 unidade=self.porcoes_referencia.first.unidade)
    transformado = transforma_valor(self.gord_trans, quantidade, unidade)
    return valor_unidade(transformado, 'g')
  end

  def colesterol_mg(quantidade=self.porcoes_referencia.first.quantidade,
                 unidade=self.porcoes_referencia.first.unidade)
    transformado = transforma_valor(self.colesterol, quantidade, unidade)
    return valor_unidade(transformado, 'mg')
  end

  def sodio_mg(quantidade=self.porcoes_referencia.first.quantidade,
            unidade=self.porcoes_referencia.first.unidade)
    transformado = transforma_valor(self.sodio, quantidade, unidade)
    return valor_unidade(transformado, 'mg')
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

    def transforma_valor(attr, quantidade, unidade)
      porcao_ref = self.porcoes_referencia.where('unidade=?', unidade).first
      return attr * quantidade.to_f / porcao_ref.quantidade
    end
end
