class ChartsController < ApplicationController
  before_filter :current_menu
  
  def pie_courses
    headers["content-type"]="text/html";
    @matches_data = []

    courses = Course.all

    courses.each do |course|
      @matches_played = Match.my_matches(current_user.id).find_all_by_course_id(course.id).size

      @matches_data<<{:course_name=>course.name,:played=>@matches_played}

    end # end - do

  end

  def basic_chart

  end

  def simple_chart

  end

  def current_menu
    @current_menu = {'matches' => '', 'courses' => '', 'charts' => 'current'}
  end

end
