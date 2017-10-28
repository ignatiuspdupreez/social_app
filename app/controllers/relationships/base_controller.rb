class Relationships::BaseController < ApplicationController
  def create
    current_user.active_relationships.build(followed_id: params[:followed_id]).save
    
    redirect_to '/friends'
  end
  
  def destroy
    current_user.active_relationships.find_by(id: params[:id]).destroy
    
    redirect_to '/friends'
  end
end