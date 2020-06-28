class Registro < ApplicationRecord
  belongs_to :alimento
  belongs_to :refeicao
  belongs_to :medida, dependent: :destroy
  accepts_nested_attributes_for :medida
end
