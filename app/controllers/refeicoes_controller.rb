class RefeicoesController < ApplicationController
  before_action :set_data, only: [:index]

  def index
    @user = User.find(params[:user_id])
    lista_refeicoes()
  end

  private
    def lista_refeicoes
      @refeicoes = @user.refeicoes.where(created_at: (
        @data.beginning_of_day ..
        @data.end_of_day
      )).order(created_at: :asc)
    end

    def set_data
      if params[:data].present?
        @data = Date.parse(params[:data])
      else
        @data = Date.today
      end
    end
end
