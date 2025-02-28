Rails.application.routes.draw do
  resources :comments
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :links do 
    resources :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'links#index'
end
