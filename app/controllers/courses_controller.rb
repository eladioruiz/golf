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
    @courses = Course.all
  end

  # GET /courses/1
  def show
    @course = Course.find(params[:id])
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
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

end
