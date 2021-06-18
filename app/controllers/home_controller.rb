class HomeController < ApplicationController
  def index
  end

  def about
  end
  
  def whatshot
  	@posts = Post.order(params[:sort]).reverse_order
  end
  
end
