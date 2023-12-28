Rails.application.routes.draw do
  namespace :chat do
    resources :rooms, only: [:index, :show] do
      resources :messages, only: [:create, :new]
    end

    #get 'messages/new'
    #get 'messages/create'
    #get 'rooms/index'
    #get 'rooms/show'
  end

  get 'home/index'
  root 'home#index'

  #namespace :chat do
  #  resources :rooms, only: [:index, :show] do
  #    resources :messages, only: [:create, :new]
  #  end
  #end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
