class HolesController < ApplicationController
  before_filter :login_required
  
  # GET /holes
  def index
    @holes = Hole.all
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
end
