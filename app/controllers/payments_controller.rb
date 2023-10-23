class PaymentsController < ApplicationController
    def create_payment
      order = Orders.build(order_params)
      order.save
  
      # Create a Razorpay order
      razorpay_order = Razorpay::Order.create(
        amount: order.total_amount * 100, # Amount in paise
        currency: 'INR',
        receipt: order.id,
        payment_capture: 1
      )
  
      # In a real application, you would save the Razorpay order ID in your database for future reference.
      order.update(razorpay_order_id: razorpay_order.id)
  
      # Redirect the user to the Razorpay payment gateway
      redirect_to razorpay_order[:short_url]
    end
  
    private
  
    def order_params
      # Define your strong parameters for the order here
      params.require(:order).permit(:total_amount, :other_attributes)
    end
  end
  