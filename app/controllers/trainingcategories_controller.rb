class TrainingcategoriesController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user

  def index
    @trainingcategories = Trainingcategory.all
  end

  def create
    @trainingcategory = Trainingcategory.new(
      name: params[:trainingcategory][:name],
      image: 'unknown.jpg'
    )
    if @trainingcategory.save
      flash[:notice] = "トレーニング種別{#{@trainingcategory.name}}を作成しました"
      redirect_to trainingcategory_path(@trainingcategory)
    else
      render('trainingcategories/new')
    end
  end

  def new
    @trainingcategory = Trainingcategory.new
  end

  def edit
    @trainingcategory = Trainingcategory.find(params[:id])
  end

  def show
    @trainingcategory = Trainingcategory.find(params[:id])
  end

  def update
    @trainingcategory = Trainingcategory.find(params[:id])
    @trainingcategory.name = params[:trainingcategory][:name]

    if @trainingcategory.save
      flash[:notice] = "トレーニング種別{#{@trainingcategory.name}}を更新しました"
      redirect_to trainingcategory_path(@trainingcategory)
    else
      render('trainingcategories/edit')
    end
  end

  def destroy
    @trainingcategory = Trainingcategory.find(params[:id])
    @trainingcategory.destroy
    flash[:notice] = 'トレーニング種別を削除しました'
    redirect_to trainingcategories_path
  end

  def ensure_correct_user
    # 管理者権限が必要
    return if @current_user.authority_id.zero?

    flash[:notice] = '権限がありません'
    redirect_to user_path(@current_user)
  end
end
