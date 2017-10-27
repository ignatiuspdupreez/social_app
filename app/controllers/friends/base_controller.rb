class Friends::BaseController < ApplicationController
  
  def lists
    @lists = Friends::Lists.new(current_user)
  end
  
  def search
  
  end
  
  def follow
  
  end
  
end