Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do 
    get 'login', to: 'devise/sessions#new'
    get 'signout', to: 'devise/sessions#destroy'
    get 'signup', to: 'devise/registrations#new'
  end
  
  root 'static_pages#home'
end
