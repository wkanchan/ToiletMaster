module SessionsHelper

  def sign_in(user)
    # store remember_token to browser cookies, for the browser to look for session
    # * using .permanent causes Rails to set "expires: 20.years.from_now.utc" automatically
    cookies.permanent[:remember_token] = user.remember_token
    # store current user to call session.current_user=(...)
    self.current_user = user
  end

  # true if current_user is non-nil
  def signed_in?
    !current_user.nil?
  end

  # method to assign current_user
  def current_user=(user)
    @current_user = user
  end

  def current_user
    # @current_user = @current_user || User.find_by_...
    # look from left to right, assign the non-nil one
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end
end
