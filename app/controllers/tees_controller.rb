# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 22/08/2009 by Eladio Ruiz
# Status::        Checked
# Comments::

class TeesController < ApplicationController
  before_filter :login_required
  
  # GET /tees
  # GET /tees.xml
  def index
    @tees = Tee.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tees }
    end
  end

  # GET /tees/1
  # GET /tees/1.xml
  def show
    @tee = Tee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tee }
    end
  end

  # GET /tees/new
  # GET /tees/new.xml
  def new
    @tee = Tee.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tee }
    end
  end

  # GET /tees/1/edit
  def edit
    @tee = Tee.find(params[:id])
  end

  # POST /tees
  # POST /tees.xml
  def create
    @tee = Tee.new(params[:tee])

    respond_to do |format|
      if @tee.save
        flash[:notice] = 'Tee was successfully created.'
        format.html { redirect_to(@tee) }
        format.xml  { render :xml => @tee, :status => :created, :location => @tee }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tee.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tees/1
  # PUT /tees/1.xml
  def update
    @tee = Tee.find(params[:id])

    respond_to do |format|
      if @tee.update_attributes(params[:tee])
        flash[:notice] = 'Tee was successfully updated.'
        format.html { redirect_to(@tee) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tee.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tees/1
  # DELETE /tees/1.xml
  def destroy
    @tee = Tee.find(params[:id])
    @tee.destroy

    respond_to do |format|
      format.html { redirect_to(tees_url) }
      format.xml  { head :ok }
    end
  end
end
