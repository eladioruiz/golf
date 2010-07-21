class HomeController < ApplicationController
  before_filter :login_required

  include ActionView::Helpers::NumberHelper


  # GET /home
  def index
    # ## STATS

    # => Matches
    @stats_num_matches = Stat.num_matches(session[:user_id])
    @stats_last_month = Stat.matches_last_month(session[:user_id])
    @stats_strokes_average = number_with_precision(Stat.strokes_average(session[:user_id]),:precision => 2)
    @stats_month_average =  number_with_precision(Stat.matches_average(session[:user_id]),:precision => 2)

    @user = current_user

    # => RESUME
    @stats_friends = PrivacyFriend.my_friends(session[:user_id]).length
    @stats_friends_pending = PrivacyFriend.my_friends_pending(session[:user_id]).length.to_i() - @stats_friends.to_i()

    # => Courses
    @stats_num_courses = Course.all.length
    @stats_last_inserted_course = Course.last.name
    @stats_most_used_course = Match.most_used_course.first.course.name + " (" + Match.most_used_course.first.num_used + " veces)"
  end

  def current_menu
    @current_menu = {'init' => 'current', 'matches' => '', 'courses' => '', 'charts' => '', 'personaldata' => ''}
  end


end
