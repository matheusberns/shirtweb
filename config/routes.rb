Rails.application.routes.draw do
  resources :departments
  devise_for :users
  resources :produtos, only: [:new, :create, :destroy, :edit, :update]
  root "produtos#index"
  get "/produtos/:id/show" => "produtos#show", as: :show_produto

end
