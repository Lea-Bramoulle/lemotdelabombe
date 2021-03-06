Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'static_page#index'

  get '/little-berlins', to: 'static_page#littleberlin'

  #get '/article', to: 'static_page#article'

resources :article  #, only: [:index, :show, :edit, :new]
resources :categorie #, only: [:show]

resources :comment
resources :like

resources :article do
    resources :avatars, only: [:create]
    resources :comment
    resources :like
  end

end
