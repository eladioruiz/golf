require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe MatchesController, :type => :controller do
  integrate_views

<<<<<<< HEAD
  describe "when getting the matches index" do
    before do    
      Match.stubs(:all).returns([])

      get :index
      post :controller => 'session' , :action => 'create', :user => 'quentin', :password => 'test'
    end

    it "should have a link to create a new match" do
      assert_select "a[href='/matches/new']"
    end
=======
  def authenticate_as(user)
    @user = user
    @user.id ||= 1
    User.stubs(:find_by_id).with(1).returns(@user)
    session[:user_id] = @user.id
>>>>>>> d3a5f42e99209661c4fa88205585ecaf2bb80746
  end

  describe "when user is authenticated" do
    before do
      authenticate_as(User.new(:name => 'Eladio'))
    end

    describe "when getting the matches index" do
      before do
        Match.stubs(:all).returns([])
        
        get :index
      end
  
      it "should have a link to create a new match" do
        assert_select "a[href='/matches/new']"
      end
    end
  
    describe "when getting the form for a new match" do
      before do
        #Match.stubs(:all).returns([])
        Course.stubs(:all).returns([])
        Tee.stubs(:all).returns([])
        User.stubs(:all).returns([])
        
        get :new
      end
  
      it "should have a match form" do
        assert_select "form[action='/matches']" do
          assert_select "select[id='match_course_id']", 1
        end
      end
  
      it "should have a player form" do
        assert_select "div.playermatch" do
          assert_select "select[name='match[players_attributes][0][user_id]']", 1
          assert_select "select[name='match[players_attributes][0][tee_id]']", 1
        end
      end
    end

#  describe "when showing a match" do
#    before do
#      
#      @match = Match.new(:id => 1, :course_id => 1, :holes => 18)
#      @course = Course.new(:id => 1, :name => 'RACE')
#      @match.course = @course
#      Match.stubs(:find).with('1').returns(@match)
#      Course.stubs(:find).with('1').returns(@course)
#      Player.stubs(:find_all_by_match_id).with('1').returns([])
#      
#      get :show, :id => '1'
#    end
#
#    it "should have a link to edit the Match" do
#      assert_select "a[href='/matches/+d/edit']"
#    end
#
#    it "should have a link to show a list with all matches" do
#      assert_select "a[href='/matches']"
#    end
#  end

  end
end

