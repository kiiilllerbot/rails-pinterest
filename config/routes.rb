Rails.application.routes.draw do
  resources :pins do 
  	resources :comments
  end
  devise_for :users
  
  root 'pins#index'
end
