class Refeicao < ApplicationRecord
  belongs_to :user
  has_many :registros
  has_many :alimentos, through: :registros

  validates :nome, presence: true
  validates :data, presence: true
  validates :horario, presence: true
  validates_time :horario
end
