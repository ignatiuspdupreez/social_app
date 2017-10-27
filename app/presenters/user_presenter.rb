class UserPresenter < BasePresenter
  presents :user
  
  def display_title
    link_to(user.name_to_display, profile_path(user))
  end
  
  
  def avatar
    return image_tag 'nobody_m.original.jpg' if user.profile_picture.file.blank?
    
    image_tag user.profile_picture.url
  end
  
  def full_names
    return '' if display_name?
    return 'your full name isn\'t set' if current_user_blank?(display)
    
    
    "Full names: #{([] << user.first_name << user.middle_name << user.last_name).join(' ')}"
  end
  
  def joined
    "Joined: #{user.created_at.strftime('%d %b %Y')}"
  end
  
  def birthday
    return 'your birthday isn\'t set' if current_user_blank?(user.date_of_birth)
    
    return '' if user.date_of_birth.blank?
    
    "Birthday: #{user.date_of_birth.strftime('%d %b %Y')}"
  end
  
  def birth_place
    return 'your birth place isn\'t set' if current_user_blank?(user.place_of_birth)
    "Birth place: #{user.place_of_birth}"
  end
  
  def nation
    return 'your nationality isn\'t set' if current_user_blank?(user.nationality)
    "Nationality: #{user.nationality}"
  end
  
  def buttons
    if current_users_profile? && is_from_profile?
      return link_to '<i class="fa fa-pencil"></i>'.html_safe,
                     '', class: 'btn btn-primary btn-sm edit-profile',
                     user_id: user.id
    end
    
    link_to '<i class="fa fa-eye"></i>'.html_safe, profile_path(user), class: 'btn btn-primary btn-sm'
  end
  
  
  private
  
  def is_from_profile?
    user.from == ProfileEnum::FROM::PROFILE
  end
  
  
  def display_name?
    false if display.blank? && !current_users_profile?
  end
  
  def display
    return nil if user.first_name.blank? && user.middle_name.blank? && user.last_name.blank?
    
    true
  end
  
  def current_user_blank?(method)
    current_users_profile? && method.blank?
  end
  
  def current_users_profile?
    current_user.id == user.id
  end

end