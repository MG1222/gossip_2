Rails.application.routes.draw do
 root 'pages#index'
 get '/team', to: 'team#show'
 get '/contact', to: 'contact#show'
 get '/welcome/:first_name', to: 'welcome#show'
 get '/author/:author_id', to: 'author#show', as: 'author'
resources :users
resources :gossips
resources :sessions, only: [:new, :create, :destroy]

end
