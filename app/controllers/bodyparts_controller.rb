class BodypartsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user

  def index
    @bodyparts = Bodypart.all
  end

  def create
    @bodypart = Bodypart.new(
      name: params[:bodypart][:name],
      image: 'unknown.jpg'
    )
    if @bodypart.save
      flash[:notice] = "部位{#{@bodypart.name}}を作成しました"
      redirect_to edit_bodypart_path(@bodypart)
    else
      render('bodyparts/new')
    end
  end

  def new
    @bodypart = Bodypart.new
  end

  def edit
    @bodypart = Bodypart.find(params[:id])
  end

  def show
    @bodypart = Bodypart.find(params[:id])
  end

  def update
    @bodypart = Bodypart.find(params[:id])
    @bodypart.name = params[:bodypart][:name]

    if @bodypart.save
      flash[:notice] = "部位{#{@bodypart.name}}を更新しました"
      redirect_to bodypart_path(@bodypart)
    else
      render('bodyparts/edit')
    end
  end

  def destroy
    @bodypart = Bodypart.find(params[:id])
    @bodypart.destroy
    flash[:notice] = '部位を削除しました'
    redirect_to bodyparts_path
  end

  def ensure_correct_user
    # 管理者権限が必要
    return if @current_user.authority_id.zero?

    flash[:notice] = '権限がありません'
    redirect_to user_path(@current_user)
  end
end
