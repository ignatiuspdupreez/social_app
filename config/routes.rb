Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  authenticated do
    root to: "wall#index", as: :authenticated_root
  end
  root to: 'home#index'
  
  resources :home
  resources :wall
  
  scope :module => :profile do
    resources :profile, except: [:index, :new, :create, :destroy]
  end
  
  scope :module => :friends do
    get '/friends', to: 'friends#lists'
  end
end
