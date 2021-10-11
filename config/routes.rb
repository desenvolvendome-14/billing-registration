Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :banks, only: %i[ create index destroy ], format: "json"
      resources :companies, only: %i[ create index ], format: "json"
      resources :cost_centers, only: %i[ create index ], format: "json"
      resources :charts_accounts, format: "json"

      resources :participants, format: "json" do
        collection do
          get :search
        end
      end
    end
  end
end
