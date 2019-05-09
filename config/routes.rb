Rails.application.routes.draw do
  resources :images, only: %i[new show create index destroy]
  root 'images#index'
end
