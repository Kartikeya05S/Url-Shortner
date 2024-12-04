Rails.application.routes.draw do
  # Mount Swagger UI and API endpoints for documentation
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  # Root route (optional, customize as needed)
  root "urls#new"

  # Routes for URL shortener
  resources :urls, only: [:new, :create, :show]

  # Redirect route for shortened URLs
  get '/:short_url', to: 'urls#redirect', as: :redirect

  # API namespace for versioning
  namespace :api do
    namespace :v1 do
      post 'shorten', to: 'urls#create'
    end
  end
end