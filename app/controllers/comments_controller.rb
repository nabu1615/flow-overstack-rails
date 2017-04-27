class CommentsController < ApplicationController
  def create
	@comment = Comment.new(comment_params)
	@comment.user_id = current_user.id
  	if @comment.save
  		redirect_to root_path
  	else
  		render plain: @comment.errors.full_messages
  	end
  end

  private

  def comment_params
	type = params[:comment][:commentable_type]
  	params.require(:comment).permit(:body, :commentable_type).merge(commentable_id: params["#{type.downcase}_id"])
  end
end
