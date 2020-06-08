class Dia < ApplicationRecord
  belongs_to :user

  validates :data, presence: true

  def self.create_if_not_exists(user)
    today = DateTime.current.to_date

    if not user.dias.where(data: today).exists?
      dia = user.dias.create(data: today)
    end
  end

  def self.string_array(dias)
    dias_string = Array.new

    dias.each do |dia|
      if dia.data.today?
        d = 'Hoje'
      elsif dia.data == Date.yesterday
        d = 'Ontem'
      else
        d = I18n.l(dia.data, format: '%A, %d de %B')
      end

      dias_string << d
    end

    return dias_string
  end
end
