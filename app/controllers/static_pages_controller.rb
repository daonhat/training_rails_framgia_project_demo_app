class StaticPagesController < ApplicationController
  def home
  	if logged_in?
    	@entry = current_user.entries.build
    	@feed_items = current_user.feed.paginate(page: params[:page])
      @comment = current_user.comments.build
    else
      @feed_items  = Entry.all.order('created_at DESC').paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
