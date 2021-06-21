class HomeController < ApplicationController
  def index
  end

  def about
  end
  
  def whatshot
  	@posts = Post.order(params[:sort]).reverse_order
  	#@useremail = User.find_by(id: params[:user_id]).email 
  end

  
end
