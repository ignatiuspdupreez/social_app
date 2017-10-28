Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :home
  
  scope :module => :wall do
    authenticated do
      root to: "wall#index", as: :authenticated_root
    end
    
    resources :wall, only: [:index]
  end

  root to: 'home#index'
  
  scope :module => :profile do
    resources :profile, except: [:index, :new, :create, :destroy]
  end
  
  scope :module => :friends do
    get '/friends', to: 'friends#lists'
  end
  
  scope :module => :relationships do
    resources :relationships, only: [:create, :destroy]
  end
  
  scope :module => :posts do
    resources :posts, only: [:create, :destroy]
  end
end
