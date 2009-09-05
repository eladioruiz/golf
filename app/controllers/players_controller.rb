# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 04/09/2009 by Eladio Ruiz
# Status::        Check
# Comments::      Pending testing

class PlayersController < ApplicationController
  
  # GET /players
  def index
<<<<<<< HEAD:app/controllers/players_controller.rb
    @players = Player.all
 
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @players }
=======
    if params[:match_id] then
      @players = Player.find_all_by_match_id(params[:match_id])
    else
      @players = Player.find(:all, :include => :match, :order => 'LOWER(matches.date_hour_match) DESC')
>>>>>>> working_copy:app/controllers/players_controller.rb
    end
  end
 
  # GET /players/1
  # GET /players/1.xml
  def show
    @player = Player.find(params[:id])
<<<<<<< HEAD:app/controllers/players_controller.rb
 
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @player }
    end
=======
>>>>>>> working_copy:app/controllers/players_controller.rb
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
<<<<<<< HEAD:app/controllers/players_controller.rb
 
    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @player }
    end
=======
>>>>>>> working_copy:app/controllers/players_controller.rb
  end
 
  # GET /players/1/edit
  def edit
    @player = Player.find(params[:id])
  end
 
  # POST /players
  def create
    @player = Player.new(params[:player])
<<<<<<< HEAD:app/controllers/players_controller.rb
 
    respond_to do |format|
      if @player.save
        flash[:notice] = 'Player was successfully created.'
        format.html { redirect_to(@player) }
        format.xml { render :xml => @player, :status => :created, :location => @player }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @player.errors, :status => :unprocessable_entity }
      end
=======

    if @player.save
      flash[:notice] = 'Player was successfully created.'
      redirect_to(@player)
    else
      render :action => "new"
>>>>>>> working_copy:app/controllers/players_controller.rb
    end
  end
 
  # PUT /players/1
  def update
    @player = Player.find(params[:id])
<<<<<<< HEAD:app/controllers/players_controller.rb
 
    respond_to do |format|
      if @player.update_attributes(params[:player])
        flash[:notice] = 'Player was successfully updated.'
        format.html { redirect_to(@player) }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @player.errors, :status => :unprocessable_entity }
      end
=======

    if @player.update_attributes(params[:player])
      flash[:notice] = 'Player was successfully updated.'
      redirect_to(@player)
    else
      render :action => "edit"
>>>>>>> working_copy:app/controllers/players_controller.rb
    end
  end
 
  # DELETE /players/1
  def destroy
    @player = Player.find(params[:id])
    @player.destroy
<<<<<<< HEAD:app/controllers/players_controller.rb
 
    respond_to do |format|
      format.html { redirect_to(players_url) }
      format.xml { head :ok }
    end
=======

    redirect_to(players_url)
>>>>>>> working_copy:app/controllers/players_controller.rb
  end
end
