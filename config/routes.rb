Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html\

get '/', to: 'welcome#index'

get '/movies/', to: 'movies#index'
get '/movies/new', to: 'movies#new'
get '/movies/:id', to: 'movies#show'
get '/movies/:id/edit', to: 'movies#edit'
post '/movies', to: 'movies#create'
patch '/movies/:id', to: 'movies#update'
delete '/movies/:id', to: 'movies#destroy'

get '/studios/', to: 'studios#index'
get '/studios/new', to: 'studios#new'
get '/studios/:id', to: 'studios#show'
get '/studios/:id/edit', to: 'studios#edit'
post '/studios', to: 'studios#create'
patch '/studios/:id', to: 'studios#update'
delete '/studios/:id', to: 'studios#destroy'
end
