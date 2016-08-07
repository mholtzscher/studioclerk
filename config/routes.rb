Rails.application.routes.draw do
  
  resources :students do
    resources :transactions
    resources :lessons  
  end
  
  root to: 'students#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
