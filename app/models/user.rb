class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_destroy :destroy_alimentos

  has_many :alimentos, dependent: :destroy
  has_many :dias, dependent: :destroy

  def destroy_alimentos
    alimentos.each do |alimento|
      # verifica se alimento está em alguma refeição
      # se estiver então não destrói
      # se não destrói
    end
  end
end
