Rails.application.routes.draw do
  
  devise_for :users
  resources :students do
    resources :credits
    resources :lessons  
  end
  
  root to: 'students#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/.well-known/acme-challenge/:id' => 'students#letsencrypt'
end
