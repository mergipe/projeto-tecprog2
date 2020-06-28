class Refeicao < ApplicationRecord
  belongs_to :user
  has_many :registros, dependent: :destroy
  has_many :alimentos, through: :registros

  validates :nome, presence: true
  validates :data, presence: true
  validates :horario, presence: true
  validates_time :horario

  after_initialize :calc_totais
  attr_reader :energia, :carb, :prot, :gord

  def calc_totais
    if !self.new_record?
      @energia = 0; @carb = 0; @prot = 0; @gord = 0

      self.registros.each do |reg|
        @energia += reg.alimento.energia_porcao(reg.quantidade, reg.unidade)
        @carb += reg.alimento.carb_total_porcao(reg.quantidade, reg.unidade)
        @prot += reg.alimento.proteina_porcao(reg.quantidade, reg.unidade)
        @gord += reg.alimento.gord_total_porcao(reg.quantidade, reg.unidade)
      end
    end
  end
end
