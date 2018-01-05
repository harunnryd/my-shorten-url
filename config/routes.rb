Rails.application.routes.draw do
  root 'shorten_url#index'
  get '/:url', to: 'shorten_url#show', as: 'show_shorten_url'
  post '/', to: 'shorten_url#create', as: 'shorten_url'
end
