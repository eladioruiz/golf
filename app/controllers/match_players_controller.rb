class MatchPlayersController < ApplicationController
  # GET /match_players
  # GET /match_players.xml
  def index
    @match = Match.find(params[:match_id])
    #@match_players = MatchPlayer.all
    @match_players = @match.players
  end

  # GET /match_players/1
  # GET /match_players/1.xml
  def show
    @match = Match.find(params[:match_id])
    @match_player = MatchPlayer.find(params[:id])
  end

  # GET /match_players/new
  # GET /match_players/new.xml
  def new
    @match = Match.find(params[:match_id])
    @match_player = MatchPlayer.build
  end

  # GET /match_players/1/edit
  def edit
    @match = Match.find(params[:match_id])
    @match_player = @match.players.find(params[:id])
  end

  # POST /match_players
  # POST /match_players.xml
  def create
    @match = Match.find(params[:match_id])
    @match_player = MatchPlayer.build(params[:match_player])

    if @match_player.save
      redirect_to match_matchplayer_url(@match, @match_player)
    else
      render :action => "new"
    end
  end

  # PUT /match_players/1
  # PUT /match_players/1.xml
  def update
    @match = Match.find(params[:match_id])
    @match_player = MatchPlayer.find(params[:id])

    if @match_player.update_attributes(params[:match_player])
      redirect_to match_matchplayer_url(@match, @match_player)
    else
      render :action => "edit"
    end
  end

  # DELETE /match_players/1
  # DELETE /match_players/1.xml
  def destroy
    @match = Match.find(params[:match_id])
    @match_player = MatchPlayer.find(params[:id])
    @match_player.destroy

    respond_to do |format|
      format.html { redirect_to match_matchplayers_path(@match) }
      format.xml  { head :ok }
    end
  end
end
