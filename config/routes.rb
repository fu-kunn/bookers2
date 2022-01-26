Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :books,only:[:new, :create, :index, :show, :edit, :destroy, :update]
  resources :users,only:[:index, :show, :edit, :update]

  patch 'books/:id' => 'books#update', as: 'update_book'
  get "/home/about" => "homes#about", as: "about"
end