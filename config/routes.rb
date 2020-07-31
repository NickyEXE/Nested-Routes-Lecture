Rails.application.routes.draw do
  resources :authors do
    resources :books
  end

  resources :books, only: [:index, :create, :new]
  # /books

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
