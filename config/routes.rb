Rails.application.routes.draw do
  get '/' => 'home#top'
  get 'maintenance' => 'home#maintenance'

  get 'login' => 'users#login_form'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'

  resources :authorities
  resources :bodyparts
  resources :trainingcategories
  resources :trainingmenus
  resources :trainings
  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
