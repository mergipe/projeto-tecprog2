class UsersController < ApplicationController
  def delete
    @user = User.find(params[:id])

    respond_to do |format|
      format.js
    end
  end
end
