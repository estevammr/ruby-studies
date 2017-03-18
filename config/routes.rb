Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tasks
  match '/tasks/:id', to: 'tasks#finish_task', as: 'finish_task', via: 'post'

  root 'welcome#index'
end
