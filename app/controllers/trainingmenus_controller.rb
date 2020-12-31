class TrainingmenusController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, { only: [:edit, :update] }

  def index
    @trainingmenus = Trainingmenu.where(user_id: @current_user.id).order(name: :desc)
  end

  def create
    @trainingmenu = Trainingmenu.new(
      user_id: @current_user.id,
      name: params[:trainingmenu][:name]
    )
    if @trainingmenu.save
      flash[:notice] = "トレーニングメニュー{#{@trainigmenu.name}}を作成しました"
      redirect_to trainingmenu_path(@trainingmenu)
    else
      render('trainingmenus/new')
    end
  end

  def new
    @trainingmenu = Trainingmenu.new
  end

  def edit
    @trainingmenu = Trainingmenu.find(params[:id])
    @trainings = Training.where(user_id: @current_user.id).or(Training.where(user_id: nil))
  end

  def show
    @trainingmenu = Trainingmenu.find(params[:id])
    @trainings = Training.where(user_id: @current_user.id).or(Training.where(user_id: nil))
  end

  def update
    @trainingmenu = Trainingmenu.find(params[:id])
    @trainingmenu.name = params[:trainingmenu][:name]

    if @trainingmenu.save
      flash[:notice] = "トレーニングメニュー{#{@trainigmenu.name}}を更新しました"
      redirect_to training_path(@trainingmenu)
    else
      render('trainingmenus/edit')
    end
  end

  def destroy
    @trainingmenu = Trainingmenu.find(params[:id])
    @trainingmenu.destroy
    flash[:notice] = 'トレーニングメニューを削除しました'
    redirect_to trainingmenus_path
  end

  def ensure_correct_user
    @trainingmenu = Trainingmenu.find(params[:id])
    return if @training.user_id == @current_user.id

    flash[:notice] = '権限がありません'
    redirect_to trainingmenus_path
  end
end
