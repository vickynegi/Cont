Rails.application.routes.draw do
  
  root 'contacts#index'
  get '/contact', to: 'contacts#index'
  post 'visitors/submission'
end
