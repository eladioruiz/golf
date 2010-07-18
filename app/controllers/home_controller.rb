class HomeController < ApplicationController
  before_filter :login_required

  # GET /home
  def index
    # ## STATS

    # => Matches
    @stats_num_matches = Player.find_all_by_user_id(current_user.id).size
    @stats_stroke_average_10 = 10
    
    @ordering = "date_hour_match DESC"
    @limits = "100000000"
    @matches = Match.my_matches(session[:user_id],@ordering,@limits).last_month
    @stats_last_month = @matches.length

    @user = current_user

    # => Courses
    @stats_num_courses = Course.all.size
    @stats_last_inserted_course = Course.last.name + " (" + Course.last.address + ")"
    @stats_most_used_course = Match.most_used_course.first.course.name + " (" + Match.most_used_course.first.num_used + " veces)"
  end

  def current_menu
    @current_menu = {'init' => 'current', 'matches' => '', 'courses' => '', 'charts' => '', 'personaldata' => ''}
  end


end
