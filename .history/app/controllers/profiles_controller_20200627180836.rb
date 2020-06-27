class ProfilesController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]

  def new
    @profile = Profile.new
  end

  def create
    session[:nickname] = profile_params[:nickname]
    session[:date_of_birth] = profile_params[:date_of_birth]
    session[:gender_id] = profile_params[:gender_id]
    session[:address_id] = profile_params[:address_id]
    session[:personality_id] = profile_params[:personality_id]
    session[:special_skill_id] = profile_params[:special_skill_id]
    session[:introduce] = profile_params[:introduce]

    @profile = Profile.new(
      nickname: profile_params[:nickname],
      date_of_birth: profile_params[:date_of_birth],
      gender_id: profile_params[:gender_id],
      address_id: profile_params[:address_id],
      personality_id: profile_params[:personality_id],
      special_skill_id: profile_params[:special_skill_id],
      introduce: profile_params[:introduce]
    )

    @profile = current_user.profiles.build(profile_params)
    if @profile.save
      redirect_to profile_path(@profile), notice: "プロフィールを登録しました。"
    else
      render :new, notice: "プロフィール登録に失敗しました。"
    end
  end

  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def edit
    @profile = Profile.find(params[:id])
    if @profile.user != current_user
        redirect_to profiles_path, alert: "他ユーザーの情報は変更出来ません。"
    end
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to profile_path(@profile), notice: "プロフィールを更新しました。"
    else
      render :edit, notice: "プロフィールの更新に失敗しました。"
    end
  end

  def destroy
    profile = Profile.find(params[:id])
    profile.destroy
    redirect_to user_path(profile.user), notice: "プロフィールの削除しました。"
  end

  private

  def profile_params
    params.require(:profile).permit(:nickname, :date_of_birth, :gender_id, :address_id, :personality_id, :special_skill_id, :introduce)
  end


end
