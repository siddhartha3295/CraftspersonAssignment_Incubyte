Rails.application.routes.draw do
  root 'calculators#new'
  post 'add', to: 'calculators#create'
  get 'result', to: 'calculators#result'
end
