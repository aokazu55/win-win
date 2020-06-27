class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_search

    def search
		if params[:q].present?
        @search = Service.ransack(search_params)
        @services = @search.result
	else
		params[:q] = { sorts: 'id desc' }
		@search = Service.ransack()
		@services = Service.all
		end
	end

	def search_params
		params.require(:q).permit(:sorts)
	end

	def liked_by?
		likes.where(user_id: user.id).exists?
	end

	protected

	def after_sign_in_path_for(resource)
		user_path(current_user)
	end

	def after_sign_up_path_for(resource)
		user_path(current_user)
	end

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	end

	def set_search
		@search = Service.ransack(params[:q])
		@search_services = @search.result
	end
end