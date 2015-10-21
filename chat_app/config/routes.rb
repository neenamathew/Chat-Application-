Rails.application.routes.draw do

  resources :groups, only: [:index, :create, :show]do
    resources :messages, only: [ :create, :index]do
    
    end
  end

  # resources :groups
  resources :messages, only: [:index, :create]do
    collection do
      get 'index/:user_id', :action => 'index'
    end
  end

  
  resources :sessions, only: [:new, :create] do
    resources :groups, only: [:index, :create ]do
      resources :messages, only: [ :create]do
        collection do
          get 'index/:user_id', :action => 'index'
        end
      end
    end
  end

  root 'sessions#new'
  match "sessions/delete_cookies" => "sessions#delete_cookies", :via => :delete

end
