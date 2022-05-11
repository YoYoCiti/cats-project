Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do 
    get 'login', to: 'users/sessions#new'
    get 'signout', to: 'users/sessions#destroy'
    get 'signup', to: 'users/registrations#new'
  end
  
  root 'static_pages#home'
end
