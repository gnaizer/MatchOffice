Rails.application.routes.draw do
  # resources :cards
  get 'api/card', to: 'cards#show'
  put 'api/card', to: 'cards#update'
  get 'api/cards', to: 'cards#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
