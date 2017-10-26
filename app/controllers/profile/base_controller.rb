class Profile::BaseController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    set_defaults
  end
  
  def edit
    @user = User.find(params[:id])
    set_defaults
    
    render '_edit', layout: false
  end
  
  def update
    @user.update(user_params)
  end
  
  private
  
  def set_defaults
    @user.profile_picture = 'nobody_m.original.jpg' if @user.profile_picture.blank?
    @user.display_name = @user.email.split('@')[0] if @user.display_name.blank?
    
    @user.assign_attributes(
      date_joined: @user.created_at,
      from: ProfileEnum::FROM::PROFILE)
  end
  
  def user_params
    require(:user).permit(:id, :email, :password, :display_name, :first_name,
                          :last_name, :date_of_birth, :place_of_birth,
                          :nationality, :profile_picture)
  end
end