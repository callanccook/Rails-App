class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
	
	def create
		@product = Product.find(params[:product_id])
		@user = current_user
	  token = params[:stripeToken]
	  # Create the charge on Stripe's servers - this will charge the user's card

	  # if statement here to sign in user
	  # if @user signed_in


	  begin
	    charge = Stripe::Charge.create(
	      amount: (@product.price * 100).to_i, # amount in cents, again
	      currency: "usd",
	      source: token,
	      description: params[:stripeEmail]
	    )

	    if charge.paid
	    	Order.create(
	    		product_id: @product.id,
	    		user_id: @user.id,
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
	  #else 
	  #flash must be logged in
	  #end
	  redirect_to product_path(@product)

	end

end
