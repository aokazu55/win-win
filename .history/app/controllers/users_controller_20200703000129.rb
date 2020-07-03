class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_user, only: [:show, :edit, :update]
  PER = 16

    def index
      @users = User.preload(:user).page(params[:page]).per(PER).order(id: "ASC")
    end

    def show
    end

    def edit
      if @user != current_user
          redirect_to user_path(current_user), alert: "不正なアクセスです。"
      end
    end

    def update
      if @user.update(user_params)
        redirect_to user_path(@user), notice: "ユーザー情報を更新しました。"
      else
        render :edit
      end
    end

    def following
      @title = "Following"
      @user  = User.find(params[:id])
      @users = @user.following
      render 'show'
    end

    def followers
      @title = "Followers"
      @user  = User.find(params[:id])
      @users = @user.followers
      render 'show'
    end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :image)
  end

end
