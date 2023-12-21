Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  namespace :admin do
    root to: "homes#top"
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :orders, only: [:show]
  end
  
  scope module: :public do
    root to: "homes#top"
    get "/about" => "homes#about"
    resources :items, only: [:index, :show]
    # 下記オリジナルアクションroutesに出てこないので後でやるのかも？今は必要なのだけ
    resources :customers, only: [:show, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
