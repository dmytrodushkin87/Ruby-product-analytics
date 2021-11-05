class SessionsController < ApplicationController
 
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
      	login_url user
        redirect_to user
      # Log the user in and redirect to the user's show page.
      else
        # Create an error message.
        flash.now[:danger] = 'Invalid email or password combination'
        render 'new'
  	  end
  end

  def destroy
  	logout_url
    redirect_to root_url
  end
end
