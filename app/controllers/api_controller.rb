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

  def getmatch
    @token    = params[:token]
    @user_id  = params[:user_id]
    @match_id = params[:match_id]

    @match = nil
    @match = Match.find(@match_id)  if User.righttoken(@token, @user_id);
    @players = Player.find_all_by_match_id(@match_id)

    @res = {:match_id => @match.id, :course_name => @match.course.name, :date_hour_match => @match.date_hour_match.strftime("%d/%m/%Y %H:%I"), :holes => @match.holes, :players => @players.map {|p| {:user_name => p.user.name, :handicap => p.handicap.nil? ? 0 : p.handicap, :tee => p.tee.barras, :user_id => p.user_id, :player_id => p.id, :card_1 => p.card.strokes_first_9, :card_2 => p.card.strokes_second_9, :card_total => p.card.strokes_total}}}

    render :json => @res.to_json()
  end

  def getstrokes
    @token    = params[:token]
    @user_id  = params[:user_id]
    @match_id = params[:match_id]
    @player_id = params[:player_id]

    @card = nil
    @card = Card.find_by_player_id(@player_id)  if User.righttoken(@token, @user_id);
    @strokes = CardStroke.find_all_by_card_id(@card.id) unless @card.nil?

    @res = nil
    @res = @strokes.map {|st| {:hole_id => st.hole_id, :hole_number => st.hole.number, :strokes => st.strokes, :putts => st.putts}}.sort{|a,b| a[:hole_number] <=> b[:hole_number]} unless @strokes.nil?

    render :json => @res.to_json()
  end

  def uploadmatchform
    render :file => 'api/uploadmatchform.html'
  end

  def uploadmatch
    um = UploadMatch.new
    um.save(params[:filename],params[:data])
    um.parseMatch

    @res = {:match_id => um.match_id.to_s()}
    render :json => @res.to_json()
  end
end
