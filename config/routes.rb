Rails.application.routes.draw do

  root 'songs#index'
  resources :songs do
    member do
      get :play
    end
  end

  get    '/menu',   to: 'menu#index'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
