Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :member, skip: [:passwords], controllers: {
    registrations: "public/members/registrations",
    sessions: 'public/members/sessions'
  }

  root to: 'public/homes#top'
  get '/about' => 'public/homes#about'

  scope module: :public do
    get "/members/quit" => "members#quit"
    patch "/members/out" => "members#out"

    devise_scope :member do
      post "members/guest_sign_in" => "members/sessions#guest_sign_in"
    end

    resources :members, only: [:show, :edit, :update] do
      resources :contacts, only: [:new, :show, :create]
    end
    resources :campsites, only: [:index, :show] do
      resources :reviews, only: [:new, :index, :show, :edit, :create, :update, :destroy]
    end
  end

  namespace :admin do
    get '/' => 'homes#top'
    resources :members, only: [:index, :show, :edit, :update]
    resources :campsites do
      resources :reviews, only: [:index, :show, :edit, :update, :destroy]
    end
    resources :contacts, only: [:edit, :update]
  end

  get '/search', to: 'searches#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
