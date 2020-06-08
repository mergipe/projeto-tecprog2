class Dia < ApplicationRecord
  belongs_to :user

  validates :data, presence: true

  def self.create_if_not_exists(user)
    today = DateTime.current.to_date

    if not user.dias.where(data: today).exists?
      dia = user.dias.create(data: today)
    end
  end
end
