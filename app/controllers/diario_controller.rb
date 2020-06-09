class DiarioController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def self.data_string(data)
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
