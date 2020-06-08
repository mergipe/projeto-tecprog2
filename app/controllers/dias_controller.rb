class DiasController < ApplicationController
  def index
    Dia.create_if_not_exists(current_user)
  end

  def show
  end
end
