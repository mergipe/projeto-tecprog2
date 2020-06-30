class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_destroy :destroy_alimentos
  after_create :create_meta

  has_many :alimentos
  has_many :refeicoes, dependent: :destroy
  has_one :meta, dependent: :destroy

  def create_meta
    Meta.create(user: self)
  end

  def destroy_alimentos
    self.alimentos.each do |alimento|
      alimento.remove
    end
  end
end
