Rails.application.routes.draw do
  get 'cat_posts/new'
  get 'cat_posts/create'
  get 'subscriptions/create'
  get 'subscriptions/destroy'
  get 'cats/new'
  get 'cats/trash'
  get '/stats' => 'static_pages#stats'
  delete 'cats/trash' => 'cats#trash'

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
      get :feed 
    end 
  end

  resources :cats do 
    member do 
      get :subscribers 
      get :cat_posts
    end 
  end

  resources :subscriptions, only: [:create, :destroy]
  resources :cat_posts, only: [:new, :create]

end
