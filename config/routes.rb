Rails.application.routes.draw do
  resources :loans, defaults: {format: :json}
  resources :loan_payments, defaults: {format: :json}
  get 'loan_payments/by_loan_id/:loan_id' => 'loan_payments#by_loan_id'
end
