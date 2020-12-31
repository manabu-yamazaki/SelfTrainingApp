class AuthoritiesController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user

  def index
    @authorities = Authority.all
  end

  def create
    @authority = Authority.new(
      name: params[:authority][:name]
    )
    if @authority.save
      flash[:notice] = "権限{#{@authority.name}}を作成しました"
      redirect_to authority_path(@authority)
    else
      render('authorities/new')
    end
  end

  def new
    @authority = Authority.new
  end

  def edit
    @authority = Authority.find(params[:id])
  end

  def show
    @authority = Authority.find(params[:id])
  end

  def update
    @authority = Authority.find(params[:id])
    @authority.name = params[:authority][:name]

    if @authority.save
      flash[:notice] = "権限{#{@authority.name}}を更新しました"
      redirect_to authority_path(@authority)
    else
      render('authorities/edit')
    end
  end

  def destroy
    @authority = Authority.find(params[:id])
    @authority.destroy
    flash[:notice] = '権限を削除しました'
    redirect_to authorities_path
  end

  def ensure_correct_user
    # 管理者権限が必要
    return if @current_user.authority_id.zero?

    flash[:notice] = '権限がありません'
    redirect_to user_path(@current_user)
  end
end
