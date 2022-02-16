Rails.application.routes.draw do
  # get 'reviews/new'
  # get 'reviews/create'
  # get 'reviews/destroy'
  # get 'restaurants/index'
  # get 'restaurants/show'
  # get 'restaurants/edit'
  # get 'restaurants/update'
  # get 'restaurants/new'
  # get 'restaurants/create'
  # get 'restaurants/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants do
    resources :reviews, only: [ :new, :create, :destroy ]
  end
end
