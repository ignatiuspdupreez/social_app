Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  authenticated do
    root to: "wall#index", as: :authenticated_root
  end
  root to: 'home#index'
  
  resources :home
  resources :wall
  
  # namespace :profile do
  #   # get '/', to: 'profile#index'
  #   resources :profile
  # end
  
  scope :module => :profile do
    resources :profile
  end
end
