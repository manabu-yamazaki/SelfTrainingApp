class UsersController < ApplicationController
  before_action :authenticate_user, { only: [:show] }
  before_action :forbid_login_user, { only: [:new, :create, :login_form, :login] }

  def index
    @users = User.all
  end

  def create
    if params[:user][:password] != params[:user][:password_confirmation]
      @error_message = 'パスワードが不一致です'
      render('users/new')
    end

    @user = User.new(
      name: params[:user][:name],
      password: params[:user][:password],
      authority_id: '1'
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'ユーザーを登録しました'
      redirect_to user_path(@user)
    else
      render('users/new')
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
    # @authorities = Authority.all
  end

  def show
    @user = User.find(params[:id])
    # @authorities = Authority.all
  end

  def update
    @user = User.find(params[:id])
    @user.name = params[:user][:name]
    @user.authority_id = params[:user][:authority_id]

    if @user.save
      flash[:notice] = "ユーザー{#{@user.name}}を更新しました"
      redirect_to users_path
    else
      render('users/show')
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'ユーザーを削除しました'
    redirect_to users_path
  end

  def login_form; end

  def login
    @user = User.find_by(name: params[:name])
    if !@user.nil? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = 'ログインしました。'
      # redirect_to先は未定
      redirect_to('')
    else
      @error_message = '名前またはパスワードが間違っています'
      @name = params[:name]
      @password = params[:password]
      render('users/login_form')
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = 'ログアウトしました'
    redirect_to login_path
  end
end
