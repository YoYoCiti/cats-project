Rails.application.routes.draw do
  get 'cats/new'

  root 'static_pages#home'

  devise_for :users, :controllers => { :registrations => :registrations }

  devise_scope :user do 
    get 'login', to: 'devise/sessions#new'
    get 'signout', to: 'devise/sessions#destroy'
    get 'signup', to: 'devise/registrations#new'
  end
  
  resources :users
  resources :cats

end
