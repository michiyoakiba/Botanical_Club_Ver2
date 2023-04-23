Rails.application.routes.draw do
  
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  } 
  
  namespace :admin do
    get '/' => 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end  
  
  
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  root to: 'public/homes#top'

  namespace :public do
    get '/' => 'homes#top'
    get '/about' => 'homes#about'
    resources :customers, only: [:index, :show, :edit, :update, :destroy]
    resources :plants, only: [:new, :create, :index, :show, :destroy]
    resource :favorites, only: [:create, :destroy]  
    resources :plant_comments, only: [:create, :destroy]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
