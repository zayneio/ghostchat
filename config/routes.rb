Rails.application.routes.draw do

  patch '/:group_slug/authenticate', to: 'groups#authenticate', as: "authenticate"
  resources :groups, param: :slug, only: [:new, :create, :show, :edit, :update, :destroy], path: '/' do
    resources :users, only: [:new, :create]
  end

  root 'groups#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
end
