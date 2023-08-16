Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'wx_pay' => 'pay#wx_pay'
  post 'wx_notify' => 'pay#wx_notify'
  get 'wx_notify' => 'pay#wx_notify'
  root to: 'home#index'
  resource :wechat, only: [:show, :create]
  devise_for :users, controllers: {
               omniauth_callbacks: 'users/omniauth_callbacks',
               registrations: 'users/registrations'
             }
end
