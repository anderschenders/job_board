Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/jobs/new", to: "jobs#new"
  post "/jobs", to: "jobs#create"

  get "/jobs", to: "jobs#index"
  get "/jobs/:id", to: "jobs#show", as: "job"

  get "/jobs/:id/edit", to: "jobs#edit", as: "edit_job"
  patch "/jobs/:id", to: "jobs#update"

  delete "/jobs/:id", to: "jobs#delete", as: "delete_job"
end
