# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 08/06/2010 by Eladio Ruiz
# Status::        Pending
# Comments::

class PrivacyFriendsController < ApplicationController
  # GET /privacy_friends
  # GET /privacy_friends.xml
  def index
    @privacy_friends = PrivacyFriend.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @privacy_friends }
    end
  end

  # GET /privacy_friends/1
  # GET /privacy_friends/1.xml
  def show
    @privacy_friend = PrivacyFriend.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @privacy_friend }
    end
  end

  # GET /privacy_friends/new
  # GET /privacy_friends/new.xml
  def new
    @privacy_friend = PrivacyFriend.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @privacy_friend }
    end
  end

  # GET /privacy_friends/1/edit
  def edit
    @privacy_friend = PrivacyFriend.find(params[:id])
  end

  # POST /privacy_friends
  # POST /privacy_friends.xml
  def create
    @privacy_friend = PrivacyFriend.new(params[:privacy_friend])

    respond_to do |format|
      if @privacy_friend.save
        flash[:notice] = 'PrivacyFriend was successfully created.'
        format.html { redirect_to(@privacy_friend) }
        format.xml  { render :xml => @privacy_friend, :status => :created, :location => @privacy_friend }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @privacy_friend.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /privacy_friends/1
  # PUT /privacy_friends/1.xml
  def update
    @privacy_friend = PrivacyFriend.find(params[:id])

    respond_to do |format|
      if @privacy_friend.update_attributes(params[:privacy_friend])
        flash[:notice] = 'PrivacyFriend was successfully updated.'
        format.html { redirect_to(@privacy_friend) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @privacy_friend.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /privacy_friends/1
  # DELETE /privacy_friends/1.xml
  def destroy
    @privacy_friend = PrivacyFriend.find(params[:id])
    @privacy_friend.destroy

    respond_to do |format|
      format.html { redirect_to(privacy_friends_url) }
      format.xml  { head :ok }
    end
  end
end
