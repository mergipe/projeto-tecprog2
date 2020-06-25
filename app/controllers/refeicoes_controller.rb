class RefeicoesController < ApplicationController
  before_action :set_data, only: [:index]

  def index
    @user = User.find(params[:user_id])
    @refeicoes = lista_refeicoes()
  end

  def new
    @user = User.find(params[:user_id])
    @data = Date.parse(params[:data])
    @refeicao = Refeicao.new
    @refeicao.nome = 'Refeição ' + (count_refeicoes() + 1).to_s
    @refeicao.data = @data
    @refeicao.horario = Time.now

    respond_to do |format|
      format.js
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @refeicao = @user.refeicoes.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @data = params[:refeicao][:data]
    @refeicao = @user.refeicoes.create(refeicao_params)

    if @refeicao.save
      redirect_to user_refeicoes_path(@user, data: @data)
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:user_id])
    @data = params[:refeicao][:data]
    @refeicao = @user.refeicoes.find(params[:id])

    if @refeicao.update(refeicao_params)
      redirect_to user_refeicoes_path(@user, data: @data)
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @data = params[:data]
    @refeicao = @user.refeicoes.find(params[:id])
    @refeicao.destroy

    redirect_to user_refeicoes_path(@user, data: @refeicao.data)
  end

  def delete
    @user = User.find(params[:user_id])
    @data = params[:data]
    @refeicao = @user.refeicoes.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  private
    def refeicao_params
      delocalize_config = { :data => :date, :horario => :time }
      params.require(:refeicao)
            .permit(:nome, *delocalize_config.keys)
            .delocalize(delocalize_config)
    end

    def get_refeicoes
      return @user.refeicoes.where(data: (
        @data.beginning_of_day ..
        @data.end_of_day
      ))
    end

    def count_refeicoes
      return get_refeicoes().count
    end

    def lista_refeicoes
      return get_refeicoes().order(data: :asc, horario: :asc)
    end

    def set_data
      if params[:data].present?
        @data = Date.parse(params[:data])
      else
        @data = Date.today
      end
    end
end
