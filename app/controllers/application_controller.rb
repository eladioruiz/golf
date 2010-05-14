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

     # Formats the date to dd/mm without leading zeroes
  def format_date_remove_zeroes(date_to_format)
        date_num= date_to_format.strftime('%d').to_i
        month_num = date_to_format.strftime('%m').to_i
        formatted_date=date_num.to_s+"/"+month_num.to_s
  end
  
  def userData
    @user_name = current_user.name unless current_user.nil?
    @handicap = current_user.handicap unless current_user.nil?
  end
end
