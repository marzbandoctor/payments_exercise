class ModifyLoanPayments < ActiveRecord::Migration[6.1]
  def change
    change_column :loan_payments, :payment_amount, :decimal, :precision => 8, :scale => 2, null: false
    change_column :loan_payments, :payment_date, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
  end
end
