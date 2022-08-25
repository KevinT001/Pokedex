Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/regions', to: 'regions#index'
  get '/regions/:id', to: 'regions#show'

  get'/pokemons', to: 'pokemons#index'
  get '/pokemons/:id', to: 'pokemons#show'
end
