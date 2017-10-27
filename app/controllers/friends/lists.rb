class Friends::Lists
  
  attr_accessor :user
  
  def initialize(user)
    @user = user
  end

  def followers
    @followers ||= user.followers
  end
  
  def following
    @following ||= user.following
  end
  
  def all_users
    @all_users ||= User.all
  end
end