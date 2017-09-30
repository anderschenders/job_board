Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/jobs", to: "jobs#index"
  get "/jobs/:id", to: "jobs#show"
end
