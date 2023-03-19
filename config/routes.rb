Rails.application.routes.draw do

  # 顧客側
  scope module: :public do
    root to: 'homes#top'
    get 'customers' => 'customers#show'
    patch '/customers/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
    get 'customers/confirm' => 'customers#confirm'
    resource :customers, only: [:edit,:update] 
    resources :bookmarks, only: [:index]
    resources :coordinates, only: [:index, :show] do
      resource :bookmarks, only: [:create, :destroy]
      resources :comments, only: [:destroy, :create]
      resource :favorites, only: [:create, :destroy]
    end
  end

  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

   # 管理者側
   namespace :admin do
    get '/' => 'customers#index'
    get 'coordinates/rank' => 'coordinates#rank'
    get 'coordinates/rank/:year/:month' => 'coordinates#monthly_rank'
    resources :coordinates, only: [:new, :create, :index, :edit, :update, :show, :destroy] do
      resources :comments, only: [:destroy]
    end

    resources :tags, only: [:index, :create, :edit, :update]
    resources :customers, only: [:edit, :update]
  end

  # 顧客用
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
}
end



