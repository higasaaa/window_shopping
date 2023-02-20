Rails.application.routes.draw do
  # namespace :admin do
  #   get 'coordinates/new'
  #   get 'coordinates/index'
  #   get 'coordinates/edit'
  # end
  # 会員側のルーティング設定
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about', as: 'about'
    resource :customers, only: [:edit, :update]
    patch '/customers/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
    get 'customers/confirm' => 'customers#confirm' #いる？
    get 'customers' => 'customers#show'
    resources :coordinates, only: [:index, :show] do
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
    resources :coordinates, only: [:new, :create, :index, :edit, :update]
    get 'coordinates/rank' => 'coordinates#rank'
    get 'coordinates/rank/:year/:month' => 'coordinates#monthly_rank'
    resources :tags, only: [:index, :create, :edit, :update]
    resources :customers, only: [:edit, :update]
    get 'search' => 'coordinates#search'
    #coordinate_tags
  end

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  # passwords: 'public/passwords'
  sessions: 'public/sessions'
}

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
  # namespace :admin do
  #   get 'customers/index'
  #   get 'customers/edit'
  # end
  # namespace :admin do
  #   get 'tags/index'
  #   get 'tags/edit'
  # end
  # namespace :admin do
  #   get 'coordinate_tags/index'
  #   get 'coordinate_tags/new'
  #   get 'coordinate_tags/edit'
  # end
  # namespace :admin do
  #   get 'homes/top'
  # end
  # namespace :public do
  #   get 'comments/index'
  #   get 'comments/edit'
  # end
  # namespace :public do
  #   get 'customers/show'
  #   get 'customers/edit'
  #   get 'customers/update'
  #   get 'customers/confirm'
  #   get 'customers/withdrawal'
  # end
  # namespace :public do
  #   get 'coordinates/index'
  #   get 'coordinates/show'
  # end
  # namespace :public do
  #   get 'homes/top'
  #   get 'homes/about'
  # end



