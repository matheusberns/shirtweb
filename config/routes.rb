Rails.application.routes.draw do
  get 'rooms/show'
  resources :chats
  resources :departments
  devise_for :users
  resources :produtos, only: [:new, :create, :destroy, :edit, :update]
  root "produtos#index"
  get "/produtos/:id/show" => "produtos#show", as: :show_produto


  # other routes
  mount ActionCable.server => '/cable'

end
