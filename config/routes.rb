Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  resources :users
  resources :products
  get 'static_pages/about' , :as => 'about_page'
  get 'static_pages/contact' , :as => 'contact_page'

  get '/products', to: 'products#index' , :as => 'products_page'
  get '/oders', to: 'orders#index', :as => 'orders_page'

  get 'static_pages/index'
  root 'static_pages#landing_page'
  post 'static_pages/thank_you'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :orders, only: [:index, :show, :create, :destroy]
end
