Rails.application.routes.draw do
  get 'votes/create'

  get 'comments/create'


  resources :questions do
  	resources :answers
    resources :comments
    
    member do
      post 'vote'
    end

  end

  resources :answers do
  	resources :comments

    member do
      post 'vote'
      delete 'vote'
    end
  end

  devise_for :users

  root "questions#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
