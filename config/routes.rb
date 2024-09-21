Rails.application.routes.draw do
  root to: "homes#top"
  get "search" => "searches#search"
  get '/search_result', to: 'searches#search_result', as: 'search_result'
  
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

  namespace :public do
  resources :rooms, only: [:index, :new, :create, :destroy] do
    resources :messages
  end
  resources :posts do
    resource :favorite, only: [:create, :destroy]
  end
  resources :users, only: [:show] do
    member do
      get :favorites
    end
  end
  end


  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:show, :destroy]
    resources :posts, only: [:show, :destroy]
  end

  devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
