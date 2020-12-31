class HomeController < ApplicationController
  before_action :authenticate_user, { only: [:maintenance] }
  before_action :ensure_correct_user, { only: [:maintenance] }

  def top
  end

  def maintenance
  end

  def ensure_correct_user
    # 管理者権限が必要
    return if @current_user.authority_id.zero?

    flash[:notice] = '権限がありません'
    redirect_to user_path(@current_user)
  end
end
