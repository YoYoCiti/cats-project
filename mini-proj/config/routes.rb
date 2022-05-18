Rails.application.routes.draw do
  get 'subscriptions/create'
  get 'subscriptions/destroy'
  get 'cats/new'

  root 'static_pages#home'

  devise_for :users, :controllers => { :registrations => :registrations }

  devise_scope :user do 
    get 'login', to: 'devise/sessions#new'
    get 'signout', to: 'devise/sessions#destroy'
    get 'signup', to: 'devise/registrations#new'
  end
  
  resources :users do 
    member do 
      get :cats 
    end 
  end

  resources :cats do 
    member do 
      get :subscribers 
    end 
  end

  resources :subscriptions, only: [:create, :destroy]

end
