class CardStrokesController < ApplicationController
  before_filter :login_required
  
  def index
    if params[:card_id] then
      @card_strokes = CardStroke.find_by_card_id(params[:card_id])
    else
      @card_strokes = CardStroke.find(:all, :include => :card)
    end
  end
  
  def show
    @card_stroke = CardStroke.find(params[:id])
  end
  
  def new
    
  end
  
  def create
    @card_stroke = CardStroke.new(params[:card_stroke])

    if @card_stroke.save
      flash[:notice] = 'Player was successfully created.'
      redirect_to(@player)
    else
      render :action => "new"
    end
  end
  
  def edit
    
  end
  
  def update
    
  end
end
