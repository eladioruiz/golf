class HolesController < ApplicationController
  before_filter :login_required
  
  # GET /holes
  def index
    @course_id = params[:course_id]
    @holes = Hole.find_all_by_course_id(@course_id)

   respond_to do |format|
      format.html { render :action => 'index'} # index.html.erb
      format.json { render :json => @holes.to_json(:only => [:id, :number]), :status => 'ok' }
    end

  end

  # GET /holes/1
  def show
    @hole = Hole.find(params[:id])
  end

  # GET /holes/new
  def new
    @hole = Hole.new
  end

  # GET /holes/1/edit
  def edit
    @hole = Hole.find(params[:id])
  end

  # POST /holes
  # POST /holes.xml
  def create
    @hole = Hole.new(params[:hole])

    if @hole.save
      flash[:notice] = 'Hole was successfully created.'
      redirect_to(@hole)
    else
      render :action => "new"
    end
  end

  # PUT /holes/1
  # PUT /holes/1.xml
  def update
    @hole = Hole.find(params[:id])

    if @hole.update_attributes(params[:hole])
      flash[:notice] = 'Hole was successfully updated.'
      redirect_to(@hole)
    else
      render :action => "edit"
    end
  end

  # DELETE /holes/1
  # DELETE /holes/1.xml
  def destroy
    @hole = Hole.find(params[:id])
    @hole.destroy

    redirect_to(holes_url)
  end

  def find_like_by_number
    @find_by = params[:num]
    @course_id = params[:course_id]
    @holes = Hole.find_like_by_number(@course_id.to_s(), '%' + @find_by.to_s() + '%')

    render :json => @holes, :template => 'holes/find_like_by_number.html.erb'
  end


end
