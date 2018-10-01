module SessionsHelper

  # Logs in the given user.
  def log_in(admin)
    session[:admin] = admin.id
  end

  def log_out
    session.delete[:admin]
    @current_admin = nil
  end

  # Returns the current logged-in user (if any)
  def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin])
  end

  # Returns true if the user is logged in, false otherwise
  def logged_in?
    !current_admin.nil?
  end
end
