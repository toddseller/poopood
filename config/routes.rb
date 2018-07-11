Rails.application.routes.draw do
  root 'welcome#index'

  get 'welcome/index'

  post 'users/create', to: 'users#create', as: 'create'

  get '/confirmation_email', to: "users#confirmation_email", as: 'confirmation_email'
  get '/unsubscribe', to: "users#unsubscribe", as: 'unsubscribe'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
