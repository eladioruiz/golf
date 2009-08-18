class MatchCardsController < ApplicationController
  # GET /match_cards
  # GET /match_cards.xml
  def index
    @match_cards = MatchCard.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @match_cards }
    end
  end

  # GET /match_cards/1
  # GET /match_cards/1.xml
  def show
    @match_card = MatchCard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @match_card }
    end
  end

  # GET /match_cards/new
  # GET /match_cards/new.xml
  def new
    @match_card = MatchCard.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @match_card }
    end
  end

  # GET /match_cards/1/edit
  def edit
    @match_card = MatchCard.find(params[:id])
  end

  # POST /match_cards
  # POST /match_cards.xml
  def create
    @match_card = MatchCard.new(params[:match_card])

    respond_to do |format|
      if @match_card.save
        flash[:notice] = 'MatchCard was successfully created.'
        format.html { redirect_to(@match_card) }
        format.xml  { render :xml => @match_card, :status => :created, :location => @match_card }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @match_card.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /match_cards/1
  # PUT /match_cards/1.xml
  def update
    @match_card = MatchCard.find(params[:id])

    respond_to do |format|
      if @match_card.update_attributes(params[:match_card])
        flash[:notice] = 'MatchCard was successfully updated.'
        format.html { redirect_to(@match_card) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @match_card.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /match_cards/1
  # DELETE /match_cards/1.xml
  def destroy
    @match_card = MatchCard.find(params[:id])
    @match_card.destroy

    respond_to do |format|
      format.html { redirect_to(match_cards_url) }
      format.xml  { head :ok }
    end
  end
end
