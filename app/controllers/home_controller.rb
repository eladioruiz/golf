class HomeController < ApplicationController
  before_filter :login_required

  # GET /home
  def index
    @stats_num_matches = Player.find_all_by_user_id(current_user.id).size
    @stats_stroke_average_10 = 10
  end
end
