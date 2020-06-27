class RegistrosController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @refeicao = Refeicao.find(params[:refeicao_id])
    @alimento = Alimento.find(params[:alimento_id])
    @registro = Registro.new

    respond_to do |format|
      format.js
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @refeicao = Refeicao.find(params[:refeicao_id])
    @alimento = Alimento.find(params[:alimento_id])
    @registro = @refeicao.registros.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @refeicao = Refeicao.find(params[:refeicao_id])
    @alimento = Alimento.find(params[:alimento_id])
    @registro = @refeicao.registros.create(registro_params)

    if @registro.save
      redirect_to user_alimentos_path(@user, refeicao: @refeicao)
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:user_id])
    @refeicao = Refeicao.find(params[:refeicao_id])
    @alimento = Alimento.find(params[:alimento_id])
    @registro = @refeicao.registros.find(params[:id])

    if @registro.update(registro_params)
      redirect_to user_refeicoes_path(@user, data: @refeicao.data)
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @refeicao = Refeicao.find(params[:refeicao_id])
    @registro = @refeicao.registros.find(params[:id])
    @registro.destroy

    redirect_to user_refeicoes_path(@user, data: @refeicao.data)
  end

  def delete
    @user = User.find(params[:user_id])
    @refeicao = Refeicao.find(params[:refeicao_id])
    @registro = @refeicao.registros.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  private
    def registro_params
      delocalize_config = { :porcao => :number }
      params[:registro][:alimento_id] = @alimento.id
      params.require(:registro)
            .permit(*delocalize_config.keys, :alimento_id)
            .delocalize(delocalize_config)
    end
end
