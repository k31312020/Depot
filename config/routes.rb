Rails.application.routes.draw do
  devise_for :users,
             path: '',
             path_names: {
                 sign_in: 'login',
                 sign_out: 'logout',
                 registration: 'signup'
             },
             controllers: {
                 sessions: 'sessions',
                 registrations: 'registrations'
             }, defaults: {format: 'json'}
  resources :orders
  resources :line_items do
    member do
      patch :decrease
      put :decrease
    end
  end
  resources :carts
  root 'store#index', as: 'store_index'
  resources :products, defaults: {format: 'json'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
