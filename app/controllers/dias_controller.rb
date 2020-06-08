class DiasController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    Dia.create_if_not_exists(@user)
    @dias = @user.dias.all
  end

  def show
  end
end
