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
    
  end
  
  def new
    
  end
  
  def create
    
  end
  
  def edit
    
  end
  
  def update
    
  end
end
