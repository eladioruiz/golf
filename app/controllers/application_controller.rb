# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  before_filter :userData
  before_filter :insertAuditTrail
  before_filter :actionAllowed?

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
    @user_handicap = current_user.handicap unless current_user.nil?
    @user_handicap = '-' if @user_handicap.nil?
    @user_id = current_user.id unless current_user.nil?
    @user_id = 0 if @user_id.nil?
  end

  # Registra todas las acciones que se producen sobre los controladores
  def insertAuditTrail
    @audit_controller = controller_name
    @audit_action = action_name

    AuditTrail.create(:user_id => @user_id, :controller => @audit_controller, :action => @audit_action)
  end

  def actionAllowed?
    @action_allowed = Right.action_allowed?(@user_id,@audit_controller,@audit_action) unless @user_id.nil?
  end

end
