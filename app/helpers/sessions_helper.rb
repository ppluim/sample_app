module SessionsHelper
  def sign_in(usert)
    cookies.permanent[:remember_token] = usert.remember_token
    self.current_user = usert
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(usert)
    @current_user = usert
  end

  def current_user
    @current_user ||= Usert.find_by_remember_token(cookies[:remember_token])
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end
end
