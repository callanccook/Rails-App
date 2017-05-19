class UserMailer < ApplicationMailer
	default from: "callan.c.cook@gmail.com"

	def contact_form(email, name, message)
  	@message = message
    	mail(:from => email,
        :to => 'callan.c.cook@gmail.com',
        :subject => "A new contact form message from #{name}")
  end

  def welcome(user)
  	@user = user
  	@appname = "Fancy Cakes"
  	mail(to: user.email, subject: "Welcome to #{@appname}!")
	end


  def thank_you
	  @name = params[:name]
	  @email = params[:email]
	  @message = params[:message]
	  UserMailer.contact_form(@email, @name, @message).deliver_now
	end
end
