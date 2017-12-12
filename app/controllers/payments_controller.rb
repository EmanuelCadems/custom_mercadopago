require 'mercadopago.rb'

class PaymentsController < ApplicationController
  def new; end

  def create
    mp = MercadoPago.new(ENV['MERCADOPAGO_KEY'])

    paymentData = {
      transaction_amount: 100,
      token: payment_params[:token],
      description: 'guitarra electrica',
      installments: 1,
      payment_method_id: payment_params[:paymentMethodId],
      payer: {
        email: payment_params[:email]
      }
    }

    payment = mp.post("/v1/payments", paymentData);
    if payment['status'] == '201' && payment['response']['status'] == 'approved'
      redirect_to thankyou_path
    else
      flash[:notice] = payment['response']['message']
      redirect_to new_payments_path
    end

  end

  def thankyou; end

  private

  def payment_params
    params.permit(:token, :paymentMethodId, :utf8, :authenticity_token, :email)
  end
end
