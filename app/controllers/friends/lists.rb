class Friends::Lists
  
  attr_accessor :user
  
  def initialize(user)
    @user = user
  end

  def followers
    @followers ||= user.folowees
  end
  
  def all_users
    @all_users ||= User.all
  end
end