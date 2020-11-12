Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :spending do
        collection { post :import}
      end

      resources :congresspeople, only: [:index]
      resources :yearly_spends, only: [:index]
    end
  end
end
