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
    resources :customers, only: [:index, :show, :edit, :update]
  end
  
  scope module: :public do
    root to: "homes#top"
    get "/about" => "homes#about"
    get "customers/information/edit", to: "customers#edit", as: "edit_customer"
    get "customers/my_page", to: "customers#show", as: "show_customer"
    patch "customers/information", to: "customers#update", as: "customer"
    resources :items, only: [:index, :show]
    resources :customers, except: [:new, :create, :show, :index, :edit, :update, :destroy] do
      collection do
        get "confirm"
        patch "withdraw"
      end
    end
    resources :cart_items, only: [:index, :update, :destroy, :create] do
      collection do
        delete "destroy_all"
      end
    end
    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        post "confirm"
        get "thanks"
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
