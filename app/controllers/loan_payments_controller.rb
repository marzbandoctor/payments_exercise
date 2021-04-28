class LoanPaymentsController < ApplicationController
  before_action :set_loan_payment, only: %i[ show update destroy ]

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: 'not_found', status: :not_found
  end

  # GET /loan_payments
  # GET /loan_payments.json
  def index
    @loan_payments = LoanPayment.all
    render json: @loan_payments, status: :ok
  end

  # GET /loan_payments/1
  # GET /loan_payments/1.json
  def show
    render json: @loan_payment, status: :ok
  end

  # GET /loan_payments/by_loan_id/1
  # GET /loan_payments/by_loan_id/1.json
  def by_loan_id
    loan_payments = LoanPayment.where(loan_id: params[:loan_id])
    if loan_payments.count > 0
      render json: loan_payments, status: :ok
    else
      render json: 'not_found', status: :not_found
    end
    
  end

  # POST /loan_payments
  # POST /loan_payments.json
  def create
    @loan_payment = LoanPayment.new(loan_payment_params)

    if @loan_payment.save
      render json: @loan_payment, status: :created
    else
      render json: @loan_payment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /loan_payments/1
  # PATCH/PUT /loan_payments/1.json
  def update
    if @loan_payment.update(loan_payment_params)
      render json: @loan_payment, status: :ok
    else
      render json: @loan_payment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /loan_payments/1
  # DELETE /loan_payments/1.json
  def destroy
    @loan_payment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan_payment
      @loan_payment = LoanPayment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def loan_payment_params
      params.require(:loan_payment).permit(:payment_amount, :payment_date, :loan_id)
    end
end
