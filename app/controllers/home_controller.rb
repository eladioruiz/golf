class HomeController < ApplicationController
  before_filter :login_required

  # GET /home
  def index
    @user_name = current_user.name
    @handicap = current_user.handicap
  end
end
