class CommentsController < ApplicationController
	before_action :set_pin
	before_action :authenticate_user!, only:[:create, :destroy]
	
	def create
		@comment = @pin.comments.new(comment_params)
		@comment.user = current_user
		@comment.save
		redirect_back(fallback_location: root_path)
	end

	def destroy
		@comment = @pin.comments.find(params[:id])
		@comment_id = @comment.id
		@comment.destroy
	end

	private
	def comment_params
		params.require(:comment).permit(:body, :pin_id)
	end
	def set_pin
		@pin = Pin.find(params[:pin_id])
	end
end
