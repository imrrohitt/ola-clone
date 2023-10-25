class Api::V1::PaymentsController < ApplicationController
    def create
      order = Order.new(order_params)
      order.save!
  
      # Create a Razorpay order
      razorpay_order = Razorpay::Order.create(
        amount: order.total_amount * 100,
        currency: 'INR',
        receipt: order.id,
        payment_capture: 1
      )
  
      # In a real application, you would save the Razorpay order ID in your database for future reference.
      order.update(razorpay_order_id: razorpay_order.id)
  
      # Redirect the user to the Razorpay payment gateway
      render json: {
        status: {code: 200, message: 'Ride book successfully.'}
      }
    end
  
    private
  
    def order_params
      params.require(:order).permit(:total_amount, :pickup_location, :dropoff_location)
    end
  end
  