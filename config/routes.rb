Rails.application.routes.draw do
  root 'welcome#index'

  get 'welcome/index'
  
  get '/confirmation_email/:token', to: "users#confirmation_email", as: 'confirmation_email'
  get '/unsubscribe_email/:token', to: "users#unsubscribe_email", as: 'unsubscribe_email'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
