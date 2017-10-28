class Wall::BaseController < ApplicationController
  def index
    users = current_user.following.map(&:id)
    users << current_user.id
    @posts = Post.includes(:user).where(user_id: users)
  end
end