Rails.application.routes.draw do
  namespace :v1 do
    resources :trails, only: [:index]
  end
end