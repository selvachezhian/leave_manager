Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :leave do
    get 'get_leave', on: :collection
    post 'add_leave', on: :collection
  end
end
