class DiarioController < ApplicationController

  @@current_date = Date.today

  def index
    @user = User.find(params[:user_id])

    if params[:mode] == 'next'
      @@current_date += 1
    elsif params[:mode] == 'prev'
      @@current_date -= 1
    else
      @@current_date = Date.today
    end

    lista_refeicoes()
  end

  def self.data_string()
    if @@current_date.today?
      return 'Hoje'
    elsif @@current_date == Date.yesterday
      return 'Ontem'
    elsif @@current_date == Date.tomorrow
      return 'Amanhã'
    else
      return I18n.l(@@current_date, format: '%A, %d de %B')
    end
  end

  private
    def lista_refeicoes
      # Lista todas as refeições de @user no dia @current_date
    end
end
