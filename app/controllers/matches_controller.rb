# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 23/09/2009 by Eladio Ruiz
# Status::        Checked 
# Comments::

class MatchesController < ApplicationController
  helper :all
  before_filter :login_required
  before_filter :apply_profile
  before_filter :initializing
  before_filter :current_menu

  # GET /matches
  def index
    @matches_unord = Match.my_matches(session[:user_id])

    @checked['index'] = " checked='1'"
    @params = params
    
    order_result

    @page = params[:q]
    @total_pages = (@matches.size / 10) + 1

    #@matches = Match.all
    respond_to do |format|
      format.html #{ render :template => '/matches/index_test.html.erb'}# index.html.erb
      format.xml  { render :xml => @matches, :file => 'matches/index.xml' }
    end

  end

  # GET /matches/1
  def show
    @match = Match.find(params[:id])
    @players = Player.find_all_by_match_id(params[:id])
  end

  # GET /matches/new
  def new
    @match = Match.new
    @player = @match.players.build if @match.players.empty?
    
    # La carga de estas colecciones se hacen para cargar los despleglables
    @courses = Course.all.sort {|a,b| a.name<=>b.name}
    @tees = Tee.all.sort {|a,b| a.barras<=>b.barras}
    #@users = User.all
    @users = current_user.my_friends
    @users << current_user
    @numusers = @users.length
    @numcourses = @courses.length
    @numtees = @tees.length
    
    # Convierto los objetos en arrays
    @courses.map!{|course| [course.name, course.id]}
    @users.map!{|user| [user.name + ' (HCP:' + format_nil(user.handicap,' - ') + ')', user.id]}
    @tees.map!{|tee| [tee.barras, tee.id]}
    
    # Nos permite identificar la acción y tomar decisiones en la vista de representación
    @_action = 'new'
  end

  # GET /matches/1/edit
  def edit
    @match = Match.find(params[:id])

    @courses = Course.all.sort {|a,b| a.name<=>b.name}
    @tees = Tee.all.sort {|a,b| a.barras<=>b.barras}
    @users = User.all
    @numusers = @users.length
    @numcourses = @courses.length
    @numtees = @tees.length
    @courses.map!{|course| [course.name, course.id]}
    @users.map!{|user| [user.name, user.id]}
    @tees.map!{|tee| [tee.barras, tee.id]}
    @_action = 'update'
  end

  # POST /matches
  def create
    @match = Match.new(params[:match])

    if @match.save
      flash[:notice] = 'Match was successfully created.'
      redirect_to(@match)
    else
      render :action => "new"
    end
  end

  # PUT /matches/1
  def update
    @match = Match.find(params[:id])
    
    if @match.update_attributes(params[:match])
      flash[:notice] = 'Match was successfully updated.'
      redirect_to(@match)
    else
      @match.players.build if @match.players.empty?
      @fields = Field.all
      render :action => "edit"
    end
  end

  # DELETE /matches/1
  def destroy
    @match = Match.find(params[:id])
    @match.destroy

    redirect_to(matches_url)
  end

  # GET /matches/1/print
  def print
    @match = Match.find(params[:id])
    @holes = @match.course.holes
    @players = @match.players
    @param_id = params[:id]
    
    render :template => "layouts/print"
  end

  # GET /matches/thisweek
  def this_week
    @matches = Match.my_matches(session[:user_id]).this_week
    @title = 'This Week'
    render :action => 'index'
  end

  # GET /matches/lastmonth
  def last_month
    @matches = Match.my_matches(session[:user_id]).last_month
    @title = 'Last Month'
    @checked['last_month'] = " checked='1'"

    order_result

    @page = params[:q]
    @total_pages = (@matches.size / 10) + 1

    #@matches = Match.all
    respond_to do |format|
      format.html { render :action => 'index'} # index.html.erb
      format.xml  { render :xml => @matches, :file => 'matches/index.xml' }
    end

  end

  # GET /matches/lastmatches
  def last_matches
    @matches_unord = Match.my_matches(session[:user_id]).last_matches
    @title = 'Last 10 Matches'
    @checked['last_matches'] = " checked='1'"

    order_result

    @page = params[:q]
    @total_pages = (@matches.size / 10) + 1

    #@matches = Match.all
    respond_to do |format|
      format.html { render :action => 'index'} # index.html.erb
      format.xml  { render :xml => @matches, :file => 'matches/index.xml' }
    end

  end

  # GET /matches/bestmatches
  def best_matches
    @matches_unord = Match.my_matches(session[:user_id]).best_matches
    @title = 'Best 10 Matches'
    @checked['best_matches'] = " checked='1'"

    order_result

    @page = params[:q]
    @total_pages = (@matches.size / 10) + 1

    #@matches = Match.all
    respond_to do |format|
      format.html { render :action => 'index'} # index.html.erb
      format.xml  { render :xml => @matches, :file => 'matches/index.xml' }
    end

  end

  # GET /matches/mymatches
  def my_matches
    @matches_unord = Match.my_matches(session[:user_id])
    @title = 'My Matches'
    @checked['index'] = " checked='1'"

    order_result

    @page = params[:q]
    @total_pages = (@matches.size / 10) + 1

    #@matches = Match.all
    respond_to do |format|
      format.html { render :action => 'index'} # index.html.erb
      format.xml  { render :xml => @matches, :file => 'matches/index.xml' }
    end

  end

private

  def apply_profile
    
  end

  def initializing
    @title = 'Total Matches'
    @userID =  session[:user_id].to_s
    @checked = {'index' => '', 'best_matches' => '', 'last_matches' => '', 'last_month' => ''}
  end

  def current_menu
    @current_menu = {'init' => '', 'matches' => 'current', 'courses' => '', 'charts' => ''}
  end

  def order_result

    if params[:find_courses_value]
      @course_filter = params[:find_courses_value]
      @course_filter_name = Course.find(@course_filter).name unless @course_filter.empty?
      @matches_unord = @matches_unord.find_all_by_course_id(@course_filter) unless @course_filter.empty?
    end
    
    if !@matches_unord.nil?
      # Ordenación después de haber recuperado los valores
      case params[:sidx]
        when 'course' then
          if params[:sord]=='desc'
            @matches = @matches_unord.sort {|a,b| b.course.name <=> a.course.name}
          else
            @matches = @matches_unord.sort {|a,b| a.course.name <=> b.course.name}
          end
        when 'date_hour_match' then
          if params[:sord]=='desc'
            @matches = @matches_unord.sort {|a,b| b.date_hour_match <=> a.date_hour_match}
          else
            @matches = @matches_unord.sort {|a,b| a.date_hour_match <=> b.date_hour_match}
          end
        when 'holes' then
          if params[:sord]=='desc'
            @matches = @matches_unord.sort {|a,b| b.holes <=> a.holes}
          else
            @matches = @matches_unord.sort {|a,b| a.holes <=> b.holes}
          end
      else
        @matches = @matches_unord.sort {|a,b| a.id <=> b.id}
      end

      @page = params[:q]
      @total_pages = (@matches.size / 10) + 1
    else
      []
    end
  end

  def format_nil(value,default)
    if value.nil? then
      default
    else
      value.to_s()
    end
  end
end

