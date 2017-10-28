class Friends::BaseController < ApplicationController
  
  def lists
    @lists = Friends::Lists.new(current_user)
  end
end