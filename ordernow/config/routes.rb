Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  resources :orders
  get 'deliver/:id ', :to => 'orders#deliver', :as => :deliver

end
