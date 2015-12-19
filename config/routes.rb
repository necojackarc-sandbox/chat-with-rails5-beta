Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
  match "/websocket", to: ActionCable.server, via: %i(get post)

  root "sessions#new"

  resources :sessions, only: %i(new create)
  resources :messages, only: %i(index create)
end
