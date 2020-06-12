class Refeicao < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :alimentos

  validates :nome, presence: true
  validates :data, presence: true
  validates :horario, presence: true
end
