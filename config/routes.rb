Rails.application.routes.draw do
  root to:"welcome#index"
  get 'welcome/index'
  get '/inicio', to:'welcome#index'
  resources :coins
end
