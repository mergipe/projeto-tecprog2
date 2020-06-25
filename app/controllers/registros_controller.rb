class RegistrosController < ApplicationController
  def index
  end

  def new
    @user = User.find(params[:user_id])
    @refeicao = Refeicao.find(params[:refeicao_id])
    @alimento = Alimento.find(params[:alimento])

    respond_to do |format|
      format.js
    end
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
    def registro_params
      delocalize_config = { :porcao => :number }
      params.require(:registro)
            .permit(*delocalize_config.keys)
            .delocalize(delocalize_config)
    end
end
