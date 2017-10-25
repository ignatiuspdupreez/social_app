class Profile::BaseController < ApplicationController

  def show
    @user = User.find(params[:id])
    
    if @user.profile_picture.blank?
      @user.profile_picture = 'nobody_m.original.jpg'
    end
    
    @user.date_joined = @user.created_at
  end
  
  private
  
  def user_params
    require(:user).permit(:id, :email, :password, :display_name, :first_name,
                          :last_name, :date_of_birth, :place_of_birth,
                          :nationality, :profile_picture)
  end
end