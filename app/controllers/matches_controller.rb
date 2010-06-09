# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 23/09/2009 by Eladio Ruiz
# Status::        Checked 
# Comments::

class MatchesController < ApplicationController
  before_filter :login_required
  before_filter :apply_profile
  before_filter :title
  before_filter :current_menu

  # GET /matches
  def index
    page = params[:page] || 1

    @matches = Match.my_matches(session[:user_id]).paginate :page => page, :order => 'id DESC'
    @userID =  session[:user_id].to_s

    @courses = Course.all

    #@matches = Match.all
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
    @courses = Course.all
    @tees = Tee.all
    #@users = User.all
    @users = current_user.my_friends
    @users << current_user
    @numusers = @users.length
    @numcourses = @courses.length
    @numtees = @tees.length
    
    # Convierto los objetos en arrays
    @courses.map!{|course| [course.name, course.id]}
    @users.map!{|user| [user.name, user.id]}
    @tees.map!{|tee| [tee.barras, tee.id]}
    
    # Nos permite identificar la acción y tomar decisiones en la vista de representación
    @_action = 'new'
  end

  # GET /matches/1/edit
  def edit
    @match = Match.find(params[:id])

    @courses = Course.all
    @tees = Tee.all
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
    
    render :template => "layouts/print"
  end

  # GET /matches/thisweek
  def this_week
    page = params[:page] || 1

    @matches = Match.my_matches(session[:user_id]).this_week.paginate :page => page, :order => 'id DESC'
    @title = 'This Week'
    render :action => 'index'
  end

  # GET /matches/lastmonth
  def last_month
    page = params[:page] || 1
    
    @matches = Match.my_matches(session[:user_id]).last_month.paginate :page => page, :order => 'id DESC'
    @title = 'Last Month'
    render :action => 'index'
  end

  # GET /matches/lastmatches
  def last_matches
    page = params[:page] || 1

    @matches = Match.my_matches(session[:user_id]).last_matches.paginate :page => page
    @title = 'Last 10 Matches'
    render :action => 'index'
  end

  # GET /matches/bestmatches
  def best_matches
    page = params[:page] || 1

    @matches = Match.my_matches(session[:user_id]).best_matches.paginate :page => page
    @title = 'Best 10 Matches'
    render :action => 'index'
  end

  # GET /matches/mymatches
  def my_matches
    page = params[:page] || 1

    @matches = Match.my_matches(session[:user_id]).paginate :page => page
    @title = 'My Matches'
    render :action => 'index'
  end

  def apply_profile
    
  end

  def title
    @title = 'Total Matches'
  end

  def current_menu
    @current_menu = {'init' => '', 'matches' => 'current', 'courses' => '', 'charts' => ''}
  end
end
