Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do 
    namespace :v1 do 
      resources :customers, only: [:show] do 
        resources :tea_subscriptions, only: [:index]
      end 

      resources :tea_subscriptions, only: [:update]
    end
  end
end
