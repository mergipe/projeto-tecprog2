class Diario
  def self.data_formatada(data)
    if data.today?
      return 'Hoje'
    elsif data == Date.yesterday
      return 'Ontem'
    elsif data == Date.tomorrow
      return 'Amanhã'
    else
      return I18n.l(data, format: '%A, %d de %B')
    end
  end
end
