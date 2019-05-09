Rails.application.routes.draw do
  resources :images, only: %i[new show create]
  root 'application#home'
end
