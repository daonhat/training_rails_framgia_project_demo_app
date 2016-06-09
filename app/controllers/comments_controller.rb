class CommentsController < ApplicationController

  def create
  	@comment = current_user.comments.build(comment_params)
  	if @comment.save
      flash[:success] = "cmt created!"
    	redirect_to root_url
  	else
    	flash.now[:danger] = "error"
  	end
  end

  def destroy
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :entry_id)
    end
end
