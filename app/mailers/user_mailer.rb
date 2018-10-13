class UserMailer < ApplicationMailer
	default from: 'nicholas.yu24@gmail.com'

	def welcome_email(user)
		@user = user
    	mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  	end

  	def order_email(order)
		@order = order
    	mail(to: @order.email, subject: 'THank you for your order')
  	end

end
