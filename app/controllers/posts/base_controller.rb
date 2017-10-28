class Posts::BaseController < ApplicationController
  def create
    current_user.posts.build(content: post_params[:content]).save
    
    redirect_to '/wall'
  end
  
  private
  
  def post_params
    params.require(:post).permit(:content)
  end
end