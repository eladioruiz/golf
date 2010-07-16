# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 04/09/2009 by Eladio Ruiz
# Status::        Checked
# Comments::      Pending testing

class PlayersController < ApplicationController
  before_filter :login_required
  before_filter :current_menu
  
  # GET /players
  def index
    if params[:q]=='2' then #subgrid del listado de 'matches'
      @param_id = params[:id]
    else
      @param_id = params[:match_id]
    end

    if @param_id then
      @players = Player.find_all_by_match_id(@param_id)
    else
      @players = Player.find(:all, :include => :match, :order => 'LOWER(matches.date_hour_match) DESC')
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @players, :file => 'players/index.xml' }
    end
  end
 
  # GET /players/1
  def show
    @player = Player.find(params[:id])
  end
 
  # GET /players/new
  def new
    @match = Match.find(params[:match_id])
    @player = Player.new
 
    @users = User.all
    @numusers = @users.length
    @users.map!{|user| [user.name, user.id]}
    
    @tees = Tee.all
    @tees.map!{|tee| [tee.barras, tee.id]}
  end
 
  # GET /players/1/edit
  def edit
    @player = Player.find(params[:id])
  end
 
  # POST /players
  def create
    @player = Player.new(params[:player])
    @player.handicap = @player.user.handicap

    if @player.save
      flash[:notice] = 'Player was successfully created.'
      redirect_to(@player)
    else
      render :action => "new"
    end
  end
 
  # PUT /players/1
  def update
    @player = Player.find(params[:id])

    if @player.update_attributes(params[:player])
      flash[:notice] = 'Player was successfully updated.'
      redirect_to(@player)
    else
      render :action => "edit"
    end
  end
 
  # DELETE /players/1
  def destroy
    @player = Player.find(params[:id])
    @player.destroy

    redirect_to(players_url)
  end

  def current_menu
    @current_menu = {'init' => '', 'matches' => 'current', 'courses' => '', 'charts' => ''}
  end


end
