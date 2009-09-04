# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 04/09/2009 by Eladio Ruiz
# Status::        Check
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
  end

  # GET /players/new
  def new
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
end
