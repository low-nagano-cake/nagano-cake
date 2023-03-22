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
  resources :customers, only: [:show, :edit, :update, :destroy]
end

# 顧客の退会確認ページ
get "customers/:id/exit" => "public/customers#exit", as: "customer_exit"





# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
  resources :items, only: [:index, :show, :new, :create, :show, :edit, :update, :destroy]
  resources :genres, only: [:index, :create, :edit, :update]
end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end






