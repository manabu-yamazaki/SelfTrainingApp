class TrainingmenusController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, { only: [:edit, :update] }

  def index
    @trainingmenus = Trainingmenu.where(user_id: @current_user.id).order(name: :desc)
  end

  def create
    @trainingmenu = Trainingmenu.new(insert_trainingmenu_params)
    if @trainingmenu.save
      flash[:notice] = "トレーニングメニュー{#{@trainingmenu.name}}を作成しました"
      redirect_to edit_trainingmenu_path(@trainingmenu)
    else
      render('trainingmenus/new')
    end
  end

  def new
    @trainingmenu = Trainingmenu.new
    @trainingmenu.trainingmenudetails.build
  end

  def edit
    @trainingmenu = Trainingmenu.find(params[:id])
    @trainingmenu.trainingmenudetails.build
  end

  def show
    @trainingmenu = Trainingmenu.find(params[:id])
  end

  def update
    @trainingmenu = Trainingmenu.find(params[:id])
    @trainingmenu.name = params[:trainingmenu][:name]

    # unless params[:trainingmenu][:new_training_id] == ''
    #   @trainingmenu.trainingmenudetails.new(
    #     trainingmenu_id: @trainingmenu.id,
    #     training_id: params[:trainingmenu][:new_training_id],
    #     order: '1'
    #   )
    # end 

    if @trainingmenu.update(update_trainingmenu_params)
      flash[:notice] = "トレーニングメニュー{#{@trainingmenu.name}}を更新しました"
      redirect_to trainingmenu_path(@trainingmenu)
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

  private

  def insert_trainingmenu_params
    params.require(:trainingmenu).permit(:name, trainingmenudetails_attributes: [:id, :training_id, :order]).merge(user_id: @current_user.id)
  end

  def update_trainingmenu_params
    params.require(:trainingmenu).permit(:name, trainingmenudetails_attributes: [:training_id, :order, :_destroy, :id])
  end

  def add_trainingmenudetail_params
    params.require(:trainingmenudetails_attributes).permit(training_id: :new_training_id).merge(trainingmenu_id: @trainingmenu.id, order: 1)
  end

  def ensure_correct_user
    @trainingmenu = Trainingmenu.find(params[:id])
    return if @trainingmenu.user_id == @current_user.id

    flash[:notice] = '権限がありません'
    redirect_to trainingmenus_path
  end
end
