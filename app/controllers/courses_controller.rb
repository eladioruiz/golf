# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 04/09/2009 by Eladio Ruiz
# Status::        Checked
# Comments::

class CoursesController < ApplicationController
  before_filter :login_required
  before_filter :current_menu

  # GET /courses
  def index
    page = params[:page] || 1
    @courses = Course.all.paginate :page => page, :order => 'name'

    @new_allowed = Right.action_allowed?(current_user.id, 'courses', 'new')
  end

  # GET /courses/1
  def show
    @course = Course.find(params[:id])
    @course_images = @course.images

    @course_map = GMap.new("map")
    @course_map.control_init(:large_map => false,:map_type => true)
    @coordinates = [@course.location_latitude,@course.location_longitude]
    @course_map.center_zoom_init(@coordinates, 12)
    @course_map.overlay_init(GMarker.new(@coordinates,:title => @course.name, :info_window => @course.name))
  end

  # GET /courses/new
  def new
    @course = Course.new
    @coursetypes = CourseType.all
    @coursetypes.map!{|coursetype| [coursetype.description, coursetype.id]}
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
    @coursetypes = CourseType.all
    @coursetypes.map!{|coursetype| [coursetype.description, coursetype.id]}
  end

  # POST /courses
  def create
    @course = Course.new(params[:course])

    if @course.save
      flash[:notice] = 'Course was successfully created.'
      redirect_to(@course)
    else
      render :action => "new"
    end
  end

  # PUT /courses/1
  def update
    @course = Course.find(params[:id])

    if @course.update_attributes(params[:course])
      flash[:notice] = 'Course was successfully updated.'
      redirect_to(@course)
    else
      render :action => "edit"
    end
  end

  # DELETE /courses/1
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    redirect_to(courses_url)
  end

  def current_menu
    @current_menu = {'init' => '', 'matches' => '', 'courses' => 'current', 'charts' => ''}
  end

  def images
    @course = Course.find(params[:id])
    @images = @course.images
    @first  = params[:first]
    @last   = params[:last]

    render :file => 'courses/images.xml'
  end
end
