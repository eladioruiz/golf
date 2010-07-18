# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 08/06/2010 by Eladio Ruiz
# Status::        Pending
# Comments::

class PrivacyFriendsController < ApplicationController
  # GET /privacy_friends
  # GET /privacy_friends.xml

  before_filter :current_menu
  
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
    @user = User.find(params[:id])
    @privacy_friend = PrivacyFriend.new
    @friendsofmine = PrivacyFriend.my_friends_pending(@user.id)
    @friendofsomeone = PrivacyFriend.friend_of_someone(@user.id)

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
    @privacy_friend.allowed = 0

    respond_to do |format|
      if @privacy_friend.save

        @privacy_inverted = PrivacyFriend.new
        @privacy_inverted.allowed = 1
        @privacy_inverted.user1_id = @privacy_friend.user2_id
        @privacy_inverted.user2_id = @privacy_friend.user1_id

        if @privacy_inverted.save
          flash[:notice] = 'PrivacyFriend was successfully created.'
          format.html { redirect_to('/privacy_friends/' + @privacy_friend.user1_id.to_s() + '/new') }
          format.xml  { render :xml => @privacy_friend, :status => :created, :location => @privacy_friend }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @privacy_friend.errors, :status => :unprocessable_entity }
        end
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

    # PUT /privacy_friends/1
  # PUT /privacy_friends/1.xml
  def allow
    @privacy_friend = PrivacyFriend.find(params[:id])
    @privacy_friend.allowed = 1
    
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
      format.html { redirect_to('/privacy_friends/' + @privacy_friend.user1_id.to_s() + '/new') }
      format.xml  { head :ok }
    end
  end

private

  def current_menu
    @current_menu = {'init' => '', 'matches' => '', 'courses' => '', 'charts' => '', 'personaldata' => 'current'}
  end


end
