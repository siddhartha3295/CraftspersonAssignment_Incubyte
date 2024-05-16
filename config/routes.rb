# config/routes.rb
Rails.application.routes.draw do
  # Create routes for new, create, and result actions
  resources :calculators, only: [:new, :create] do
    collection do
      # Custom route for the result action
      get 'result'
    end
  end

  # Set the root path to the new action of calculators controller
  root 'calculators#new'
end
