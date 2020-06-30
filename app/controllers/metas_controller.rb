class MetasController < ApplicationController
  def edit
    @user = User.find(params[:user_id])
    @meta = @user.meta
  end

  def update
    @user = User.find(params[:user_id])
    @meta = @user.meta

    if @meta.update(meta_params)
      redirect_to user_refeicoes_path(@user),
        :flash => {:notice=> 'Metas atualizadas'}
    else
      render 'edit'
    end
  end

  private
    def meta_params
      delocalize_config = { :energia => :number, :carb_total => :number,
                            :proteina => :number, :gord_total => :number }
      params.require(:meta)
            .permit(*delocalize_config.keys)
            .delocalize(delocalize_config)
    end
end
