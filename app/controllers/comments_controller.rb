class CommentsController < ApplicationController

  def create
  	@comment = current_user.comments.build(comment_params)
    @entry = Entry.find(@comment.entry_id)
  	if @comment.save
      respond_to do |format|
          format.html { redirect_to root_url }
          format.js
        end
  	else
    	flash.now[:danger] = "error"
      redirect_to :back
  	end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @entry = @comment.entry
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :entry_id)
    end
end
