HolidayReminder::Application.routes.draw do
  devise_for :users

  devise_scope :user do
    get "signup", to: "users/registrations#new"
  end

  resources :clients

  root to: "home#index"
end
