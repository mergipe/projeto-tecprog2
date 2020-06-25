class RegistrosController < ApplicationController
  def index
  end

  def new
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
