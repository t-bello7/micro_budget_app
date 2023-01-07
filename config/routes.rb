Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :categories, only: %i[index show new create destroy] do
    resources :budgets, only: %i[index show new create destroy]
  end

  # Defines the root path route ("/")
  root 'splash#index'
end
