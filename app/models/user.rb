class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_destroy :destroy_alimentos

  has_many :alimentos
  has_many :refeicoes, dependent: :destroy

  def destroy_alimentos
    self.alimentos.each do |alimento|
      alimento.remove
    end
  end
end
