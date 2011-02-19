class ApplicationController < ActionController::Base
  protect_from_forgery

  def logged_in?
    true
  end

  def set_email
    nil
  end
end
