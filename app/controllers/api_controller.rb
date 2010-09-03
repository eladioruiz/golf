class ApiController < ApplicationController

  def authentication
    @user = params[:user] || "eladio"
    @pass = params[:password] || "ruiz"

    @user = User.authenticate("eladioruiz", "Oidale27")

    if @user.nil?
      @error_code = "-1"
      @token = "NILL"
    else
      @error_code = "0"
      @token = calculatetoken(@user.login,@pass)
    end
    @res = {"error_code" => @error_code, "token" => @token}

    respond_to do |format|
      format.json { render :json => @res }
    end
  end

private

  def calculatetoken(login, password)
    Digest::SHA1.hexdigest("--2788--" + login.concat(password) + "--")
  end
end
