Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  resources :orders
  get 'deliver/:id ', :to => 'orders#deliver', :as => :deliver
  get 'next', :to => 'orders#tomorrow_order'
  get 'back', :to => 'orders#yesterday_order'
  get 'today', :to => 'orders#today_order'
end
