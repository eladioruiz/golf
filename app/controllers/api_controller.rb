class ApiController < ApplicationController

  def authentication
    @login = params[:login] || "eladio"
    @password = params[:password] || "ruiz"

    @user = User.authenticate(@login, @password)

    if @user.nil?
      @error_code = "-1"
      @token = ""
    else
      @error_code = "0"
      @token = calculatetoken(@user.login,@password)
    end
    @res = {"error_code" => @error_code, "token" => @token, "login" => @login, "password" => @password}

    respond_to do |format|
      format.json { render :json => @res }
    end
  end

private

  def calculatetoken(login, password)
    Digest::SHA1.hexdigest("--2788--" + login.concat(password) + "--")
  end
end
