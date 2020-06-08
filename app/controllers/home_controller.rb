class HomeController < ApplicationController
  def index
    redirect_to user_dias_path(current_user)
  end
end
