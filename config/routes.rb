Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, format: 'json' do
    resources :recommended_books, only: [:index]
    resources :monthly_rankings, only: [:index]
    resources :three_months_rankings, only: [:index]
    resources :six_months_rankings, only: [:index]
    resources :it_engineer_books_awards, only: [:index]
    resources :editorial_department_recommendations, only: [:index]
  end
end
