Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :artists do
    resources :albums, only: %i[new create]
    resources :tags, only: :create
  end

  resources :albums, only: :destroy
end
