Rails.application.routes.draw do
  root to: "extractions#index"
  resources :extractions
end
