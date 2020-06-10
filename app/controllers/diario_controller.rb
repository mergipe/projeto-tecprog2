class DiarioController < ApplicationController
  def index
    session[:data_selecionada] = Date.today
  end
end
