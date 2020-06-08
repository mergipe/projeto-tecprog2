class CustomSessionsController < Devise::SessionsController
  after_action :after_login, :only => :create

  def after_login
    Dia.create_if_not_exists(current_user)
  end
end
