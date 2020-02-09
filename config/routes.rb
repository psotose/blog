Rails.application.routes.draw do
  get 'posts', to: 'posts#index'
  get 'users/sign_in', to: 'posts#dashboard'
  get 'posts/dashboard', to: 'posts#dashboard'
  get 'posts/list', to: 'posts#create', as:'created_post'
  post 'posts', to: 'posts#save', as:'create_post'
  get 'posts/:id/edit', to:'posts#edit', as: 'edit_post'
  delete 'posts/:id', to: 'posts#destroy', as: 'deleted_post'
  get 'posts/:id', to: 'posts#show', as: 'show_post'
  patch 'posts/:id', to: 'posts#update', as: 'post'
  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

