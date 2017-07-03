Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}, controllers: { registrations: "user_registrations" }
  resources :products do 
    resources :comments
  end
  resources :users

  get 'static_pages/about' , :as => 'about_page'

  get 'static_pages/contact' , :as => 'contact_page'

  get '/products', to: 'products#index' , :as => 'products_page'

  get '/orders', to: 'orders#index', :as => 'orders_page'

  get 'static_pages/index'

  root 'static_pages#landing_page'

  post 'static_pages/thank_you'

  post 'payments/create'

  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :orders, only: [:index, :show, :create, :destroy]
end
