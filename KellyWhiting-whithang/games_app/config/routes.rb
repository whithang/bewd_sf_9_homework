Rails.application.routes.draw do
  resources :rock_paper_scissors, only: [:show, :new]
  resources :secret_numbers, only: [:show, :new]
  resources :games, only: [:index]
  root "games#index"
end
