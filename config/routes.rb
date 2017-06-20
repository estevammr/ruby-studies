Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    resources :tasks do
      resources :events
    end
    match '/tasks/:id', to: 'tasks#finish_task', as: 'finish_task', via: 'post'
    get '/tasks_finished', to: 'tasks#tasks_finished', as: 'tasks_finished'
    root to: 'tasks#index', as: :authenticated_root
  end
  
  root to: redirect('/users/sign_in')
end
