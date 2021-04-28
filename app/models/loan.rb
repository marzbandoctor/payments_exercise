class Loan < ActiveRecord::Base
  has_many :loan_payments
  attr_accessor :outstanding_balance

  def outstanding_balance
    return self.funded_amount - sum_of_loan_payments
  end

  def sum_of_loan_payments
    LoanPayment.where(loan_id: self.id)&.sum(&:payment_amount)
  end

end
