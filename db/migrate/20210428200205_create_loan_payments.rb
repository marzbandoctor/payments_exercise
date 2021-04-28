class CreateLoanPayments < ActiveRecord::Migration[6.1]
  def change
    create_table :loan_payments do |t|
      t.decimal :payment_amount, :precision => 8, :scale => 2
      t.datetime :payment_date
      t.references :loan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
