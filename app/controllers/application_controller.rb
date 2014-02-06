class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # Ist der eingeloggte User bei Admin angekreuzt dann ist er berechtigt
  # Wenn man kein Admin ist wird man bei bestimmten Seite 
  # die Info kriegen "Du bist nicht berechtigt"
  def authenticate_admin
    unless current_user.admin == true
      redirect_to root_path, alert: 'Du bist nicht berechtigt'
    end
  end
end
