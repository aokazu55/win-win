class LikesController < ApplicationController
	def create
		like = current_user.likes.create(service_id: params[:service_id])
		flash[:success] = "この投稿をお気に入りに登録しました"
		redirect_to service_path(like.service.id)
	end

	def destroy
		like = current_user.likes.find_by(id: params[:id]).destroy
		flash[:danger] = "この投稿のお気に入りを解除しました"
		redirect_to service_path(like.service.id)
	end
end
