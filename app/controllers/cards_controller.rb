# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 04/09/2009 by Eladio Ruiz
# Status::        Pending 
# Comments::

class CardsController < ApplicationController
  # GET /cards
  # GET /cards.xml
  def index
    @cards = Card.all
  end

  # GET /cards/1
  def show
    @card = Card.find(params[:id])
  end

  # GET /cards/new
  def new
    @player = Player.find(params[:player_id])
    @holes_count = @player.match.holes
    @card = Card.new(:player_id => params[:player_id])
    @holes_count.times do |index|
      @holes[index] = 0
    end
  end

  # GET /cards/1/edit
  def edit
    @card = Card.find(params[:id])
  end

  # POST /cards
  # POST /cards.xml
  def create
    @card = Card.new(params[:card])

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
