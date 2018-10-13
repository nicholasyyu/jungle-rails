class UsersController < ApplicationController
	def new
    	@user = User.new
	end

	def create
	
    	@user = User.new(user_params)
    	if @user.save!
    		session[:user_id] = @user.id
    		# Tell the UserMailer to send a welcome email after save
        	# UserMailer.with(user: @user).welcome_email.deliver_now
        	UserMailer.welcome_email(@user).deliver_now
	      	redirect_to '/', notice: 'User created!'
	    else
	      	render :new
	    end
  	end

	private
	def user_params
		params.require(:user).permit(
			:last_name,
      		:first_name,
      		:email,
      		:password,
      		:password_confirmation
    	)
  	end
end
