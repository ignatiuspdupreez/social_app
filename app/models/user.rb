require 'carrierwave/orm/activerecord'
class User < ApplicationRecord
  attr_accessor :date_joined, :from
  
  mount_uploader :profile_picture, ProfilePictureUploader

  has_many :active_relationships, class_name:  'Relationship',
           foreign_key: 'follower_id',
           dependent:   :destroy

  has_many :following, through: :active_relationships, source: :followed

  has_many :passive_relationships, class_name:  "Relationship",
           foreign_key: "followed_id",
           dependent:   :destroy

  has_many :followers, through: :passive_relationships, source: :follower



  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  def name_to_display
    return email.split('@')[0] if display_name.blank?
    
    display_name
  end
  
  def follow(other_user)
    following << other_user
  end
  
  def unfollow(other_user)
    following.delete(other_user)
  end
  
  def following?(other_user)
    following.include?(other_user)
  end
  
  
end
