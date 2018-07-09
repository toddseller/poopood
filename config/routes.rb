Rails.application.routes.draw do
  root 'welcome#index'

  get 'welcome/index'

  resources :users do
    member do
      get '/confirmation_email', to: "users#confirmation_email", as: 'confirmation_email'
      get '/unsubscribe_email', to: "users#unsubscribe_email", as: 'unsubscribe_email'
    end
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
