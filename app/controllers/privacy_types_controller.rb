# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 08/06/2010 by Eladio Ruiz
# Status::        Pending
# Comments::

class PrivacyTypesController < ApplicationController
  # GET /privacy_types
  # GET /privacy_types.xml
  def index
    @privacy_types = PrivacyType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @privacy_types }
    end
  end

  # GET /privacy_types/1
  # GET /privacy_types/1.xml
  def show
    @privacy_type = PrivacyType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @privacy_type }
    end
  end

  # GET /privacy_types/new
  # GET /privacy_types/new.xml
  def new
    @privacy_type = PrivacyType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @privacy_type }
    end
  end

  # GET /privacy_types/1/edit
  def edit
    @privacy_type = PrivacyType.find(params[:id])
  end

  # POST /privacy_types
  # POST /privacy_types.xml
  def create
    @privacy_type = PrivacyType.new(params[:privacy_type])

    respond_to do |format|
      if @privacy_type.save
        flash[:notice] = 'PrivacyType was successfully created.'
        format.html { redirect_to(@privacy_type) }
        format.xml  { render :xml => @privacy_type, :status => :created, :location => @privacy_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @privacy_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /privacy_types/1
  # PUT /privacy_types/1.xml
  def update
    @privacy_type = PrivacyType.find(params[:id])

    respond_to do |format|
      if @privacy_type.update_attributes(params[:privacy_type])
        flash[:notice] = 'PrivacyType was successfully updated.'
        format.html { redirect_to(@privacy_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @privacy_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /privacy_types/1
  # DELETE /privacy_types/1.xml
  def destroy
    @privacy_type = PrivacyType.find(params[:id])
    @privacy_type.destroy

    respond_to do |format|
      format.html { redirect_to(privacy_types_url) }
      format.xml  { head :ok }
    end
  end
end
