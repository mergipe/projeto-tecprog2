class AlimentosController < ApplicationController
  def index
    @alimentos = Alimento.all
  end

  def show
    @alimento = Alimento.find(params[:id])
  end

  def new
  end

  def edit
  end

  def create
    @alimento = Alimento.new(alimento_params)
    @alimento.save
    redirect_to @alimento
  end

  def update
  end

  def destroy
  end

  private
    def alimento_params
      params.require(:alimento).permit(
        :nome, :marca, :porcao, :unidade, :porcoes_pacote, :energia, :proteina,
        :carb_total, :carb_disp, :fibra, :acucar, :gord_total, :gord_sat,
        :gord_mono, :gord_poli, :gord_trans, :colesterol, :sodio
      )
    end
end
