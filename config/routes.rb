Rails.application.routes.draw do

## Customer
# ルート
  root :to => "public/homes#top"

  get '/admin' => 'admin/homes#top', as: 'admin'
  get "about" => "public/homes#about", as: "about"


  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }


scope module: 'public' do
  resources :items, only: [:index, :show]
  resource :customer, only: [:show, :edit, :update, :destroy] do
    get :exit, on: :collection
  end
  resources :cart_items, only: [:index,:update,:destroy,:create] do
    delete :destroy_all, on: :collection
  end
  resources :orders, only: [:new,:index,:check,:complete,:create,:show] do
    get :complete, on: :collection
    post :check, on: :collection
  end
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
end





  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
  resources :items, only: [:index, :show, :new, :create, :show, :edit, :update, :destroy]
  resources :genres, only: [:index, :create, :edit, :update]
  resources :customers, only: [:index, :show, :edit, :update]
  resources :orders, only: [:show, :update]
  resources :order_details, only: [:update]
  get '/' => 'admin/homes#top'
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end




