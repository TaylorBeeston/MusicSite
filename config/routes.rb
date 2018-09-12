Rails.application.routes.draw do

  root 'songs#index'
  resources :songs do
    member do
      get :play
    end
  end

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
