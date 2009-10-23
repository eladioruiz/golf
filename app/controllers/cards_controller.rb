# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 23/10/2009 by Eladio Ruiz
# Status::        Pending 
# Comments::

class CardsController < ApplicationController
  before_filter :login_required
  
  # GET /cards
  def index
    @cards = Card.all
  end

  # GET /cards/1
  def show
    @card = Card.find(params[:id])
    @card_strokes = Card_Strokes.find_by_card_id(params[:card_id])
  end

  # GET /cards/new
  def new
    @card = Card.new
    @card_stroke = @card.card_strokes.build if @card.card_strokes.empty?
    
  end

  # GET /cards/1/edit
  def edit
    @card = Card.find(params[:id])
  end

  # POST /cards
  def create
    
    @player = Player.find(params[:player_id])
    @match = Match.find_by_player(params[:player_id])
    @card = Card.new(:player_id => @player_id, :match_id => @match.id)

    if @card.save
      flash[:notice] = 'Card was successfully created.'
      redirect_to(@card)
    else
      render :action => "new"
    end
  end

  # PUT /cards/1
  def update
    @card = Card.find(params[:id])

    if @card.update_attributes(params[:card])
      flash[:notice] = 'Card was successfully updated.'
      redirect_to(@card)
    else
      render :action => "edit"
    end
  end

  # DELETE /cards/1
  def destroy
    @card = Card.find(params[:id])
    @card.destroy

    redirect_to(cards_url)
  end
end
