Rails.application.routes.draw do
  root to: 'tops#top'
  
  resources :tweets do
    post :confirm
  end
end
