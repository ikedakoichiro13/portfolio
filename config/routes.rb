Rails.application.routes.draw do
  root to: "homes#top"
  get "search" => "searches#search"
  get '/search_result', to: 'searches#search_result', as: 'search_result'

  namespace :public do
    resources :posts
    resources :rooms, only: [:index, :new, :create]
    resources :users, only: [:show, :edit, :update]
  end


  devise_for :admins, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
  end

  devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
