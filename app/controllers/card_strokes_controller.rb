class CardStrokesController < ApplicationController
  before_filter :login_required
  
  def index
    @card_strokes = CardStrokes.find_by_card_id(params[:card_id])
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
