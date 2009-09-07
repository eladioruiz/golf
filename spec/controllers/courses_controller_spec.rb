require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe CoursesController, :type => :controller do
  integrate_views

  def authenticate_as(user)
    @user = user
    @user.id ||= 1
    User.stubs(:find_by_id).with(1).returns(@user)
    session[:user] = @user.id
  end

  describe "when user is authenticated" do
    before do
      authenticate_as(User.new(:name => 'Eladio'))
    end

    describe "when getting the courses index page" do
      before do
        Course.stubs(:all).returns([])

        get :index
      end

      it "should have a link to create a new course" do
        assert_select "a[href='/courses/new']", 1
      end
    end

    describe "when getting the page for a new course" do
      before do
        get :new
      end

      it "should have a course form" do
        assert_select "form[action='/courses']" do
          assert_select "input[id='course_name']", 1
        end
      end

    end

    describe "when showing a course" do
      before do
        @course = Course.new(:name => 'RACE')
        @course.id = 1
        Course.stubs(:find).with('1').returns(@course)

        get :show, :id => '1'
      end

      it "should have a link to edit the Course" do
        assert_select "a[href='/courses/1/edit']"
      end

      it "should have a link to show a list with all courses" do
        assert_select "a[href='/courses']"
      end
    end
  end

  describe "when user is not authenticated" do
    describe "when getting the course index page" do
      before do
        get :index
      end

      it "should redirect to login form" do
        response.should redirect_to(:controller => 'account', :action => 'login')
      end
    end
  end



end

