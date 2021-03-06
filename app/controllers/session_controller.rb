# This controller handles the login/logout function of the site.  
class SessionController < ApplicationController

  # render new.rhtml
  def new
    @user = User.new
  end

  def create
    self.current_user = User.authenticate(params[:login], params[:password])
    if logged_in?
      if params[:remember_me] == "1"
        current_user.remember_me unless current_user.remember_token?
        cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
      end
      AuditTrail.create(:user_id => current_user.id, :controller => 'session', :action => 'new')
      redirect_back_or_default('/home')
      cookies[:userID] = {:value => self.current_user.id}
      flash[:notice] = "Logged in successfully"
    else
      @user = User.new
      flash[:notice] = "Usuario y/o password incorrectos."
      render :action => 'new'
    end
  end

  def destroy
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "Se ha desconectado correctamente."
    redirect_back_or_default('/home')
  end
end
