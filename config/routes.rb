Rails.application.routes.draw do
  namespace :public do
    get 'bookmarks/create'
    get 'bookmarks/destroy'
  end
  
  # 会員側のルーティング設定
  scope module: :public do
    root to: 'homes#top'
    resource :customers, only: [:edit, :update]
    get 'customers' => 'customers#show'
    patch '/customers/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
    get 'customers/confirm' => 'customers#confirm'
    resources :bookmarks, only: [:index]
    resources :coordinates, only: [:index, :show] do
      resource :bookmarks, only: [:create, :destroy]
      resources :comments, only: [:destroy, :create] #update,index削除した
      resource :favorites, only: [:create, :destroy]
    end
  end

  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

   # 管理者側のルーティング設定
   namespace :admin do
    get '/' => 'customers#index'
    get 'coordinates/rank' => 'coordinates#rank'
    get 'coordinates/rank/:year/:month' => 'coordinates#monthly_rank'
    resources :coordinates, only: [:new, :create, :index, :edit, :update, :show] do
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
 


