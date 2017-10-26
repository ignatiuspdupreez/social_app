module ProfileHelper
  
  def full_names
    return '' if display_name?
    return 'your full name isn\'t set' if current_user_blank?(display)
    
    
    "Full names: #{([] << first_name << middle_name << last_name).join(' ')}"
  end
  
  def joined
    "Joined: #{created_at.strftime('%d %b %Y')}"
  end
  
  def birthday
    return 'your birthday isn\'t set' if current_user_blank?(date_of_birth)
    "Birthday: #{date_of_birth.strftime('%d %b %Y')}"
  end
  
  def birth_place
    return 'your birth place isn\'t set' if current_user_blank?(place_of_birth)
    "Birth place: #{place_of_birth}"
  end
  
  def nation
    return 'your nationality isn\'t set' if current_user_blank?(nationality)
    "Nationality: #{nationality}"
  end
  
  def buttons
    if current_users_profile? && is_from_profile?
      return link_to '<i class="fa fa-pencil"></i>'.html_safe,
                     '',
                     class: 'btn btn-primary btn-sm edit-profile'
    end
    
    link_to '<i class="fa fa-eye"></i>'.html_safe, profile_path(@user), class: 'btn btn-primary btn-sm'
  end
  
  
  private
  
  def is_from_profile?
    from == ProfileEnum::FROM::PROFILE
  end
  
  
  def display_name?
    false if display.blank? && !current_users_profile?
  end
  
  def display
    return nil if first_name.blank? && middle_name.blank? && last_name.blank?
    
    true
  end
  
  def current_user_blank?(method)
    current_users_profile? && method.blank?
  end
  
  def current_users_profile?
    current_user.id == id
  end
  
  def method_missing(*args, &block)
    @user.send(*args, &block)
  end
end
