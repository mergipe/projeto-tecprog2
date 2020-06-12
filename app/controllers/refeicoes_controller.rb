class RefeicoesController < ApplicationController
  def index
    session[:data_selecionada] = Date.today
    @user = User.find(params[:user_id])
    lista_refeicoes()
  end

  def lista_refeicoes
    @refeicoes = @user.refeicoes.where(created_at: (
      session[:data_selecionada].beginning_of_day ..
      session[:data_selecionada].end_of_day
    )).order(created_at: :asc)
  end
end
