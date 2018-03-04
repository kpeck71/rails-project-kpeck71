Rails.application.routes.draw do

  post 'recipes/:id/cooked', to: 'recipes#cooked', as: 'cooked'

  resources :recipes
  resources :categories
  resources :users

  get '/signup', to: 'users#new'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
