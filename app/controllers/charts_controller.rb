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

  def regularity_strokes
    @course = Course.new
    headers["content-type"]="text/html";

    if params[:course]
      @course_id = params[:course][:id] || 0
    else
      @course_id = 0
    end
    @course_name = Course.find(@course_id).name unless @course_id==0

    stats_regularity = Stat.regularity_strokes(@course_id,current_user.id)
    @regularity_data = []

    unless stats_regularity.empty?
      stats_regularity.each do |stat|
        @regularity_data<<{:date_hour_match=>stat.date_hour_match,:strokes=>stat.strokes_total}
      end
    end

    @title = "Regularidad en su juego"
  end

  def regularity_per_hole
    @course = Course.new
    headers["content-type"]="text/html";

    if params[:course]
      @course_id = params[:course][:id] || 0
      @course = Course.find(@course_id)
    else
      @course_id = 0
    end
    @course_name = ''
    @course_name = Course.find(@course_id).name unless @course_id==0

    if params[:hole]
      @hole_id = params[:hole][:id] || 0
    else
      @hole_id = 0
    end
    @hole_number = 0
    @hole_number = Hole.find(@hole_id).number unless @hole_id==0

    @holes = @course.holes

    stats_regularity = Stat.regularity_per_hole(@hole_id,current_user.id)
    @regularity_data = []

    unless stats_regularity.empty?
      stats_regularity.each do |stat|
        @regularity_data<<{:date_hour_match => stat.date_hour_match,:strokes => stat.strokes}
      end
    end

    @title = "Regularidad por Hoyo"
  end

  def compare_match
    headers["content-type"]="text/html";

    @match_id = params[:id]
    @match = Match.find(@match_id)
    @players = @match.players
    @holes = @match.holes

    @title = "Regularidad por Hoyo"

    render :layout => false
  end

  def current_menu
    @current_menu = {'init' => '', 'matches' => '', 'courses' => '', 'charts' => 'current'}
  end

end
