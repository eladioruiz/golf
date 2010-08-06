# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 24/10/2009 by Eladio Ruiz
# Status::        Pending 
# Comments::

class CardsController < ApplicationController
  before_filter :login_required
  before_filter :current_menu
  
  # GET /cards
  def index
    @cards = Card.all
  end

  # GET /cards/1
  def show
    @card = Card.find(params[:id])
    @card_strokes = CardStroke.find_all_by_id(params[:id])
    @card_holes = @card_strokes.count
    @params = params
  end

  # GET /cards/new
  def new
    @card = Card.new
    @card.player = Player.find(params[:player_id])
    @card_strokes = @card.card_strokes.build if @card.card_strokes.empty?
    @matches = Match.find_all_by_id(params[:match_id])
    @players = Player.find_all_by_id(params[:player_id])
    @match = @matches.first
    @player = @players.first
    
    @matches.map!{|match| [match.description, match.id]}
    @players.map!{|player| [player.user.name, player.id]}
    @n_holes = Match.find(params[:match_id]).holes
    @holes = Hole.find_all_by_course_id(Match.find(params[:match_id]).course.id)

    @holes.each_with_index do |hole,index|
      @card.card_strokes[index] = CardStroke.new(:hole_id => hole.id, :strokes => 0, :putts => 0)
    end
    #@has_card = @card.player.has_card?
  end

  # GET /cards/1/edit
  def edit
    @card = Card.find(params[:id])
    @matches = Match.find_all_by_id(@card.match_id)
    @players = Player.find_all_by_id(@card.player_id)
    @holes = @card.holes
    @match = @matches.first

    @matches.map!{|match| [match.description, match.id]}
    @players.map!{|player| [player.user.name, player.id]}
  end

  # POST /cards
  def create
    
    @player = Player.find(params[:card][:player_id])
    @match = Match.find(params[:card][:match_id])
    @card = Card.new(:player_id => @player.id, :match_id => @match.id)

    if @card.save      
      params[:card][:card_strokes_attributes].keys.each do |hole|
        @strokes = params[:card][:card_strokes_attributes][hole][:strokes]
        @putts = params[:card][:card_strokes_attributes][hole][:putts]
        @hole_id = params[:card][:card_strokes_attributes][hole][:hole_id]

        @card.add_strokes_per_hole(@hole_id,@strokes,@putts)        
      end
      @card.recalculate_strokes
      flash[:notice] = 'Card was successfully created.'
      redirect_to(@match)
    else
      render :action => "new"
    end
#    @debug = params[:card][:card_strokes_attributes]
#    render "debug.html"
  end

  # PUT /cards/1
  def update
    @card = Card.find(params[:id])
    if @card.update_attributes(params[:card])
      @card.recalculate_strokes
      flash[:notice] = 'Card was successfully updated.'
      redirect_to(@card.match)
    else
      render :action => "edit"
    end
  end

  # DELETE /cards/1
  def destroy
    @card = Card.find(params[:id])
    @card.destroy

    redirect_to(@card.match)
  end

  # GET /cards/1/print
  def print
    @card = Card.find(params[:id])
    @match = @card.match
    @holes = @match.course.holes
    @players = Player.find_all_by_id(@card.player_id)

    render :action => "../layouts/print"
  end

  def current_menu
    @current_menu = {'init' => '', 'matches' => 'current', 'courses' => '', 'charts' => ''}
  end

end
