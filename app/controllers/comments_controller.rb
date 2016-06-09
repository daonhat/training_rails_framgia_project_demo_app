class CommentsController < ApplicationController

  def create
  	@comment = current_user.comments.build(comment_params)
    @entry = Entry.find(@comment.entry_id)
    if @result = current_user.following?(@entry.user)
        if @valid = @comment.valid?
        @comment.save  
          respond_to do |format|
            format.html { redirect_to root_url }
            format.js
            end
        else
          respond_to do |format|
            format.html { redirect_to root_url }
            format.js
          end
        end
    else
      respond_to do |format|
            format.html { redirect_to root_url }
            format.js
        end
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
