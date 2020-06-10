class Refeicao < ApplicationRecord
  belongs_to :user

  validates :nome, presence: true
  validates :data, presence: true
  validates :horario, presence: true
end
