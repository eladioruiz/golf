# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  before_filter :userData

  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem

  # If you want "remember me" functionality, add this before_filter to Application Controller
  #before_filter :login_from_cookie

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  def userData
    @user_name = current_user.name unless current_user.nil?
    @handicap = current_user.handicap unless current_user.nil?
  end
end
