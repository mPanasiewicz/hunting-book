Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'pages/build_in' => 'high_voltage/pages#show', id: 'build_in'
  get '/homepage/', to: 'homepage#index', as: 'homepage'
end
