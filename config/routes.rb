Rails.application.routes.draw do
  root 'members#index'
  resources :members do 
    resources :friendships
  end
end
