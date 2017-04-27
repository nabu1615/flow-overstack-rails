Rails.application.routes.draw do
  get 'comments/create'

  resources :questions do
  	resources :answers
    resources :comments
  end

  resources :answers do
  	resources :comments
  end

  devise_for :users

  root "questions#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
