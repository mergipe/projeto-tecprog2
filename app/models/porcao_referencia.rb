class PorcaoReferencia < ApplicationRecord
  belongs_to :alimento

  validates :quantidade, presence: true, numericality: {greater_than: 0}
  validates :unidade, presence: true, uniqueness: { scope: :alimento_id }
end
