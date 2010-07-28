class ChartsController < ApplicationController
  before_filter :current_menu
  
  def pie_courses
    headers["content-type"]="text/html";
    @matches_data = []

    courses = Match.pie_courses(current_user.id)

    courses.each do |course|
      @matches_played = course.n_times.to_i()
      @course_name = course.course.name

      if @matches_played>0
        @matches_data<<{:course_name=>@course_name,:played=>@matches_played}
      end

    end # end - do

    @title = "Campos Jugados"
  end

  def basic_chart

  end

  def simple_chart

  end

  def current_menu
    @current_menu = {'init' => '', 'matches' => '', 'courses' => '', 'charts' => 'current'}
  end

end
