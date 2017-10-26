class Profile::BaseController < ApplicationController
  
  def show
    @user = User.find_by(id: params[:id])
    set_defaults
  end
  
  def edit
    @user = User.find_by(id: params[:id])
    set_defaults
    
    render '_edit', layout: false
  end
  
  def update
    @user = User.find_by(id: params[:id])
    @user.update(user_params)
    
    redirect_to profile_path @user
  end
  
  private
  
  def set_defaults
    
    # if @user.profile_picture.file.nil?
    #   File.open('/social_app/app/assets/images/nobody_m.original.jpg') do |f|
    #     @user.profile_picture = f
    #   end
    # end
    
    @user.display_name = @user.email.split('@')[0] if @user.display_name.blank?
    
    @user.assign_attributes(
      date_joined: @user.created_at,
      from: ProfileEnum::FROM::PROFILE)
  end
  
  def user_params
    params.require(:user).permit(:id, :email, :password, :display_name, :first_name,
                                 :last_name, :middle_name, :date_of_birth, :place_of_birth,
                                 :nationality, :profile_picture)
  end
end