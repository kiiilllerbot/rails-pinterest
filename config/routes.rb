Rails.application.routes.draw do

  resources :pins do
  	member do
      put "like", to: "pins#upvote"
    end
  	resources :comments
  end
  devise_for :users
  
  root 'pins#index'
  
end
