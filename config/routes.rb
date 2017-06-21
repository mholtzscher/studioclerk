Rails.application.routes.draw do
  
  namespace :admin do
    resources :users
    resources :credits
    resources :lessons
    resources :students

    root to: "users#index"
  end

  devise_for :users
  resources :students do
    resources :credits
    resources :lessons  
    resources :reports, only: [:index]
  end
  
  root to: 'students#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
