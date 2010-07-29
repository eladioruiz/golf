class ChartsController < ApplicationController
  before_filter :current_menu
  
  def pie_courses
    headers["content-type"]="text/html";

    @stat = Stat.new
    
    @matches_data = []

    if (!params[:startDate])
      @startDate = '2000/01/01'.to_date();
    else
      @startDate = (params[:startDate][:year].to_s() + "/" + params[:startDate][:month].to_s() + "/" + params[:startDate][:day].to_s()).to_date();
    end

    if (!params[:endDate])
      @endDate = Date.today(0)
    else
      @endDate = (params[:endDate][:year].to_s() + "/" + params[:endDate][:month].to_s() + "/" + params[:endDate][:day].to_s()).to_date();
    end

    courses = Match.pie_courses(current_user.id,@startDate,@endDate)

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
