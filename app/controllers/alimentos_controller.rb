class AlimentosController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @meus_alimentos = @user.alimentos.search(params[:search])

    if params[:refeicao]
      @refeicao = Refeicao.find(params[:refeicao])
      @todos_alimentos = Alimento.search(params[:search])
      render 'index_all'
    else
      render 'index_user'
    end
  end

  def new
    @user = User.find(params[:user_id])
    @alimento = Alimento.new
    @alimento.porcoes_referencia.build
  end

  def edit
    @user = User.find(params[:user_id])
    @alimento = @user.alimentos.find(params[:id])
    @alimento.porcoes_referencia.build
  end

  def create
    @user = User.find(params[:user_id])
    @alimento = @user.alimentos.create(alimento_params)

    if @alimento.errors[:porcoes_referencia] and @alimento.porcoes_referencia.size < 1
      @alimento.porcoes_referencia.build
    end

    if @alimento.save
      redirect_to user_alimentos_path(@user)
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:user_id])
    @alimento = @user.alimentos.find(params[:id])

    if @alimento.errors[:porcoes_referencia] and @alimento.porcoes_referencia.size == 1
    end

    if @alimento.update(alimento_params)
      redirect_to user_alimentos_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @alimento = @user.alimentos.find(params[:id])
    @alimento.remove

    redirect_to user_alimentos_path(@user)
  end

  def search
    @user = User.find(params[:user_id])
    @meus_alimentos = @user.alimentos.search(params[:search])

    if params[:refeicao_id]
      @todos_alimentos = Alimento.search(params[:search])
      @refeicao = params[:refeicao_id]
      render 'tabs'
    else
      render 'table'
    end
  end

  def info
    @alimento = Alimento.find(params[:id])
    @quantidade = params[:quantidade]
    @unidade = params[:unidade]

    render 'info'
  end

  def delete
    @user = User.find(params[:user_id])
    @alimento = @user.alimentos.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  private
    def alimento_params
      delocalize_config = { :energia => :number, :proteina => :number,
        :carb_total => :number, :carb_disp => :number, :fibra => :number,
        :acucar => :number, :gord_total => :number, :gord_sat => :number,
        :gord_mono => :number, :gord_poli => :number, :gord_trans => :number,
        :colesterol => :number, :sodio => :number }
      delocalize_config_nested = { :quantidade => :number }

      porcoes = params[:alimento][:porcoes_referencia_attributes]
      porcoes.each_key do |id|
        porcoes[id].delocalize(:quantidade => :number)
      end

      params.require(:alimento)
            .permit(:nome, :marca, *delocalize_config.keys,
                    porcoes_referencia_attributes: [:id, :quantidade, :unidade])
            .delocalize(delocalize_config)
    end
end
