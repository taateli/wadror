class ApplicationController < ActionController::Base
  protect_from_forgery

  # määritellään, että metodi current_user tulee käyttöön myös näkymissä
  helper_method :current_user, :current_session

  def current_session
    return nil if session[user_id].nil?
    session
  end

  def current_user
    return nil if session[:user_id].nil?
    User.find(session[:user_id])
  end
end
