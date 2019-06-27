Rails.application.routes.draw do
  root to: 'tops#top'
  
  resources :tweets do
    collection do
      post :confirm
    end
  end
end
