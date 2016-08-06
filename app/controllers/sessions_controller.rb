class SessionsController < ApplicationController

  def create

    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #log_in refers to the helper method we created in the helpers folder
       log_in(user)
       #whenever we pass an Active Records model to a redirect_to it will
       #automatically redirect to the show method
       redirect_to user_path(user)
    else
    #render the 'new view' when the create method is called
    #user can't sign in; send notice
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def new
  end

  def destroy
    logout
    redirect_to root_path
  end
end
