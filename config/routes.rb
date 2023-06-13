Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :member, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  root to: 'public/homes#top'
  get '/about' => 'public/homes#about'

  scope module: :public do
    get "/members/quit" => "members#quit"
    patch "/members/out" => "members#out"
    resources :members, only: [:show, :edit, :update]
    resources :campsites, only: [:index, :show] do
      resources :reviews, only: [:new, :show, :edit, :create, :update, :destroy]
    end
    resources :contacts, only: [:new, :show, :create]
  end

  namespace :admin do
    get '/' => 'homes#top'
    resources :members, only: [:index, :show, :edit, :update]
    resources :campsites
    resources :reviews, only: [:index, :show, :edit, :update, :destroy]
    resources :contacts, only: [:edit, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
