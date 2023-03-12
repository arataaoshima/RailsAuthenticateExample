Rails.application.routes.draw do

  get 'users/index'
  get 'users/new'
  post 'users/create'
  get '/login_form' => 'users#login_form'
  post '/login' => 'users#login'
  post '/logout' => 'users#logout'
  get 'users/:id' => 'users#show'
  get 'users/:id/edit' => 'users#edit'
  post 'users/:id/update' => 'users#update'

  get '/' => 'home#top'
  get '/about' => 'home#about'

  get 'posts/index' => 'posts#index'
  get 'posts/new' => 'posts#new'
  post 'posts/create' => 'posts#create'
  get 'posts/:id/edit' => 'posts#edit'
  get 'posts/:id' => 'posts#show'
  post 'posts/:id/update' => 'posts#update'
  post 'posts/:id/destroy' => 'posts#destroy'
end
