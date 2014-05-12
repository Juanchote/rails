Railstutorial::Application.routes.draw do

  root 'static_pages#home'
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup' => 'users#new'
  get 'signin' => 'sessions#new'
  delete 'signout' => 'sessions#destroy'

  resources :microposts

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
