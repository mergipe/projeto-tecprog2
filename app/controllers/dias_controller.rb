class DiasController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    Dia.create_if_not_exists(@user)
    @dias = @user.dias.all.order('data asc')
  end

  def show
    @user = User.find(params[:user_id])
    @dia = @user.dias.find(params[:id])
  end
end
