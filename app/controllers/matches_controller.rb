# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 23/09/2009 by Eladio Ruiz
# Status::        Checked 
# Comments::

class MatchesController < ApplicationController
  before_filter :login_required

  # GET /matches
  def index
    page = params[:page] || 1
    #@posts = Post.paginate_by_board_id @board.id, :page => page, :order => 'updated_at DESC'
    @matches = Match.paginate :page => page, :order => 'id DESC'
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
    @users = User.all
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
    @_action = 'udpdate'
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

  def print
    @match = Match.find(params[:id])
    @holes = @match.course.holes
    @players = @match.players
    
    render :action => "../layouts/print"

  end
end
