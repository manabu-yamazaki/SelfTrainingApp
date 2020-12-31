class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  before_action :set_current_user

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def authenticate_user
    return unless @current_user.nil?

    flash[:notice] = 'ログインが必要です'
    redirect_to login_path
  end

  def forbid_login_user
    return if @current_user.nil?

    flash[:notice] = 'すでにログインしています'
    redirect_to user_path(@current_user)
  end

  private

    def record_not_found
      render plain: '404 Not Found', status: :not_found
    end
end
