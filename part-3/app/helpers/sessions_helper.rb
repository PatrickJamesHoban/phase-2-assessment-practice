helpers do

  def set_user(user)
    session[:user_id] = user.id
  end

  # Grab a teacher to check these over before using them again.  Checked with Ken and updated.

  def logged_in?
    #  !! Converts the value to a boolean
    #  !!"hello" would be true
    #  !!nil would be false
    !!current_user
  end

  def current_user
    # a ||= b  means if a is undefined assign it the value of b otherwise leave it alone
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

end
