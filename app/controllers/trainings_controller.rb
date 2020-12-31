class TrainingsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, { only: [:edit, :update, :destroy] }

  def index
    @trainings = Training.where(user_id: @current_user.id)
  end

  def create
    @training = Training.new(
      name: params[:training][:name],
      explanation: params[:training][:explanation],
      image: nil,
      url: params[:training][:url],
      time: params[:training][:time],
      strength: params[:training][:strength],
      user_id: @current_user.id,
      trainingcategory_id: params[:training][:trainingcategory_id],
      bodypart_id: params[:training][:bodypart_id]
    )
    if @training.save
      flash[:notice] = "トレーニング{#{@training.name}}を作成しました"
      redirect_to training_path(@training)
    else
      render('trainings/new')
    end
  end

  def new
    @training = Training.new
  end

  def edit
    @training = Training.find(params[:id])
  end

  def show
    @training = Training.find(params[:id])
  end

  def update
    @training = Training.find(params[:id])
    @training.name = params[:training][:name]
    @training.explanation = params[:training][:explanation]
    @training.url = params[:training][:url]
    @training.time = params[:training][:time]
    @training.strength = params[:training][:strength]
    @training.trainingcategory_id = params[:training][:trainingcategory_id]
    @training.bodypart_id = params[:training][:bodypart_id]

    if @training.save
      flash[:notice] = "トレーニング{#{@training.name}}を更新しました"
      redirect_to training_path(@training)
    else
      render('trainings/edit')
    end
  end

  def destroy
    @training = Training.find(params[:id])
    @training.destroy
    flash[:notice] = 'トレーニングを削除しました'
    redirect_to trainings_path
  end

  def ensure_correct_user
    @training = Training.find(params[:id])
    return if @training.user_id == @current_user.id

    flash[:notice] = '権限がありません'
    redirect_to trainings_path
  end
end
