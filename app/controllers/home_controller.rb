class HomeController < ApplicationController
  before_filter :login_required

  # GET /home
  def index
    # ## STATS

    # => Matches
    @stats_num_matches = Player.find_all_by_user_id(current_user.id).size
    @stats_stroke_average_10 = 10

    # => Courses
    @stats_num_courses = Course.all.size
    @stats_last_inserted_course = Course.last.name + " (" + Course.last.address + ")"
    @stats_most_used_course = Match.most_used_course.first.course.name + " (" + Match.most_used_course.first.num_used + " veces)"
  end
end
