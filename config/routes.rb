Rails.application.routes.draw do
  root 'welcome#index'

  get 'welcome/index'

  resources :users do
    member do
      get '/confirmation_email'
      get '/unsubscribe_email'
    end
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
