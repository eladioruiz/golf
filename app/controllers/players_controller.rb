# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 04/09/2009 by Eladio Ruiz
# Status::        Pending refactoring
# Comments::      Pending testing

class PlayersController < ApplicationController
  
  # GET /players
  def index
    if params[:match_id] then
      @players = Player.find_all_by_match_id(params[:match_id])
    else
      @players = Player.find(:all, :include => :match, :order => 'LOWER(matches.date_hour_match) DESC')
    end
  end

  # GET /players/1
  # GET /players/1.xml
  def show
    @player = Player.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @player }
    end
  end

  # GET /players/new
  # GET /players/new.xml
  def new
    @player = Player.new

    @users = User.all
    @numusers = @users.length
    @users.map!{|user| [user.name, user.id]}
    
    @tees = Tee.all
    @tees.map!{|tee| [tee.barras, tee.id]}

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @player }
    end
  end

  # GET /players/1/edit
  def edit
    @player = Player.find(params[:id])
  end

  # POST /players
  # POST /players.xml
  def create
    @player = Player.new(params[:player])

    respond_to do |format|
      if @player.save
        flash[:notice] = 'Player was successfully created.'
        format.html { redirect_to(@player) }
        format.xml  { render :xml => @player, :status => :created, :location => @player }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @player.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /players/1
  # PUT /players/1.xml
  def update
    @player = Player.find(params[:id])

    respond_to do |format|
      if @player.update_attributes(params[:player])
        flash[:notice] = 'Player was successfully updated.'
        format.html { redirect_to(@player) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @player.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.xml
  def destroy
    @player = Player.find(params[:id])
    @player.destroy

    respond_to do |format|
      format.html { redirect_to(players_url) }
      format.xml  { head :ok }
    end
  end
end
