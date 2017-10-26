require 'carrierwave/orm/activerecord'
class User < ApplicationRecord
  attr_accessor :date_joined, :from
  
  mount_uploader :profile_picture, ProfilePictureUploader
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
