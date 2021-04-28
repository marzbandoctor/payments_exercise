class LoanPayment < ActiveRecord::Base
  belongs_to :loan
  validate :payment_cannot_exceed_outstanding_balance, :on => :create

  def payment_cannot_exceed_outstanding_balance
    if self.loan.funded_amount - self.loan.sum_of_loan_payments < self.payment_amount
      errors.add(:payment_amount, "cannot exceed outstanding balance.")
    end
  end

end
