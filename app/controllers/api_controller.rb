class ApiController < ApplicationController

  protect_from_forgery :only => [:create, :update, :destroy]

  def authentication
    @login    = params[:login] || "eladio"
    @password = params[:password] || "ruiz"

    @user = User.authenticate(@login, @password)

    if @user.nil?
      @error_code = "-1"
      @token = ""
      @user_id = "0"
    else
      @error_code = "0"
      # @token = calculatetoken(@user.login,@password)
      @token = User.generatetoken(@user.login,@password)
      @user_id = @user.id.to_s
    end
    @res = {"error_code" => @error_code, "token" => @token, "login" => @login, "password" => @password, "user_id" => @user_id}

    respond_to do |format|
      format.json { render :json => @res }
    end
  end

  def getcourses
    @token    = params[:token]
    @user_id  = params[:user_id]
    
    @courses = nil
    @courses = Course.all if User.righttoken(@token, @user_id);

    render :json => @courses.to_json(:only => [:id, :name, :address])
  end

  def infocourse
    @token    = params[:token]
    @user_id  = params[:user_id]

    @course_id = params[:course_id]

    @course = nil
    @course = Course.find(@course_id) if User.righttoken(@token, @user_id);
    respond_to do |format|
      format.json { render :json => @course }
    end
  end
  
  def getmatches
    @token    = params[:token]
    @user_id  = params[:user_id]

    @ordering = "date_hour_match DESC"
    @limits = "50"
    @course_filter = nil

    @matches = nil
    @matches = Match.my_matches_android(@user_id,@ordering,@limits,@course_filter)  if User.righttoken(@token, @user_id);
      
    render :json => @matches.to_json(:only => [:match_id, :course_name, :date_hour])
  end

  def getfriends
    @token   = params[:token]
    @user_id = params[:user_id]

    @friends = nil
    @user = User.find(@user_id)  
    @friends = PrivacyFriend.my_friends(@user) if User.righttoken(@token, @user_id);

    if !@friends.nil?
      @friends_aux = Array.new(@friends.size+1, Hash.new)

#      @friends_aux = []
      @friends.each_with_index { |f,i|
        @friends_aux[i+1] = {:id => f.user.id, :name => f.user.name }
      }
      @friends_aux[0] = {:id => @user_id, :name => @user.name }
      
    end

    render :json => @friends_aux.to_json()
  end

  def getinfoholes
    @course_id  = params[:course_id]
    @token      = params[:token]
    @user_id    = params[:user_id]

    @holes = nil
    if User.righttoken(@token, @user_id);
      @course     = Course.find(@course_id)
      @holes      = @course.holes
    end

    render :json => @holes.to_json()
  end

end
