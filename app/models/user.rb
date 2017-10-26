require 'carrierwave/orm/activerecord'
class User < ApplicationRecord
  attr_accessor :date_joined, :from
  
  mount_uploader :profile_picture, ProfilePictureUploader
  
  has_many :user_followers
  has_many :user_folowees, class_name: 'UserFollower', foreign_key: 'follower_id'
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  def name_to_display
    return email.split('@')[0] if display_name.blank?
    
    display_name
  end
end
