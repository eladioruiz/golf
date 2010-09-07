class ApiController < ApplicationController

  protect_from_forgery :only => [:create, :update, :destroy]

  def authentication
    @login = params[:login] || "eladio"
    @password = params[:password] || "ruiz"

    @user = User.authenticate(@login, @password)

    if @user.nil?
      @error_code = "-1"
      @token = ""
      @user_id = "0"
    else
      @error_code = "0"
      @token = calculatetoken(@user.login,@password)
      @user_id = @user.id.to_s
    end
    @res = {"error_code" => @error_code, "token" => @token, "login" => @login, "password" => @password, "user_id" => @user_id}

    respond_to do |format|
      format.json { render :json => @res }
    end
  end

  def getcourses
    @token = params[:token]
    
    @courses = nil
    @courses = Course.all #if @token

    render :json => @courses.to_json(:only => [:id, :name])
  end

  def infocourse
    @token = params[:token]

    @course_id = params[:course_id]

    @course = Course.find(@course_id)
    respond_to do |format|
      format.json { render :json => @course }
    end
  end
private

  def calculatetoken(login, password)
    Digest::SHA1.hexdigest("--2788--" + login.concat(password) + "--")
  end
end
