Rails.application.routes.draw do
  # เส้นทางสำหรับการเข้าสู่ระบบ (login/logout)
  get 'login', to: 'sessions#new', as: 'login'  # หน้าเข้าสู่ระบบ
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'


  # เส้นทางสำหรับการลงทะเบียนผู้ใช้
  resources :users, only: [:new, :create]

  # เส้นทางสำหรับโพสต์, คอมเมนต์, ไลค์
  resources :posts do
    resources :comments, only: [:create, :destroy, :show]
    resources :likes, only: [:index, :create, :destroy]
  end

  # กำหนดหน้าแรกให้ไปที่โพสต์
  root 'posts#index'
end
