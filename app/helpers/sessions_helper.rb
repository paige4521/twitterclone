module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    #this is not the preferred way to write this code, but for the sake of understanding
    #@current_user = @current_user || User.find_by(id: sesion[:user_id]) is the same as
    #@current_user ||=User.find_by(id: session[:user_id])
    # ||= translates as "or equals"
   @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
    
  end

  def logout
    session.delete(:user_id)
    @current_user = nil

  end
end
