class StaticPagesController < ApplicationController
  def home
  	if logged_in?
    	@entry = current_user.entries.build
    	@feed_items = current_user.feed.paginate(page: params[:page])
      @comment = current_user.comments.build
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
