class HomeController < ApplicationController
  def index
    redirect_to user_diario_index_path(current_user)
  end
end
