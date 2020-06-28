class ServicesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_service, only: [:show, :edit, :update]
  PER = 12


    def new
      @service = Service.new
    end

    def create
      @service = current_user.services.build(service_params)
      if @service.save
        redirect_to service_path(@service), notice: "サービスを投稿しました。"
      else
        render :new, alert: "サービス投稿に失敗しました。。。"
      end
    end

    def index
      @services = Service.page(params[:page]).per(PER)
    end

    def show
      @like = current_user.likes.find_by(service_id: @service.id)
      @likes= @service.like_users
    end

    def edit
      if @service.user_id != current_user.id
          redirect_to services_path, alert: "他ユーザーの情報は変更出来ません。"
      end    
    end

    def update
      if @service.update(service_params)
        redirect_to service_path(@service), notice: "サービスを更新しました。"
      else
        render :edit, alert: "サービスを更新に失敗しました。"
      end
    end

    def destroy
      service = Service.find(params[:id])
      service.destroy
      redirect_to user_path(service.user), notice: "サービスを削除しました。"
    end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:main_service_id, :service_detail_id, :service_name, :price, :working_time, :period_start, :period_end, :image, :confidence_level_id, :remark, :transportation_expenses)
  end
end