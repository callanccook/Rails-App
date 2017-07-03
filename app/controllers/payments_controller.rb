class PaymentsController < ApplicationController

	def create
		@product = Product.find(params[:product_id])
		@user = current_user
	  token = params[:stripeToken]
	  # Create the charge on Stripe's servers - this will charge the user's card

	  begin
	    charge = Stripe::Charge.create(
	      amount: (@product.price * 100).to_i, # amount in cents, again
	      currency: "usd",
	      source: token,
	      description: params[:stripeEmail],
	      receipt_email: params[:stripeEmail]
	    )

	    if charge.paid
	    	Order.create(
	    		product_id: @product.id,
	    		user_id: @user_id,
	    		total: @product.price,
	    		)
	    	flash[:notice] = "Your payment was processed successfully."
	    end

	  rescue Stripe::CardError => e
	    # The card has been declined
	    body = e.json_body
    	err = body[:error]
    	flash[:notice] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
	  end
	  redirect_to root_path
	end

end
