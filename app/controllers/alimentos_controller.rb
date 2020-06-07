class AlimentosController < ApplicationController
  def index
    @alimentos = Alimento.all
  end

  def show
    @alimento = Alimento.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def new
    @alimento = Alimento.new
  end

  def edit
    @user = User.find(params[:user_id])
    @alimento = Alimento.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @alimento = @user.alimentos.create(alimento_params)

    if @alimento.save
      redirect_to alimentos_path
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:user_id])
    @alimento = @user.alimentos.find(params[:id])

    if @alimento.update(alimento_params)
      redirect_to alimentos_path
    else
      render 'edit'
    end
  end

  def destroy
    @alimento = Alimento.find(params[:id])
    @alimento.destroy

    redirect_to alimentos_path
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
