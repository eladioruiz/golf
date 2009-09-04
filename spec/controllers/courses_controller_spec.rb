require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe CoursesController, :type => :controller do
  integrate_views

  describe "when getting the courses index" do
    before do
      Course.stubs(:all).returns([])
      
      get :index
    end

    it "should have a link to create a new course" do
      assert_select "a[href='/courses/new']"
    end
  end

  describe "when getting the form for a new course" do
    before do
      get :new
    end

    it "should have a course form" do
      assert_select "form[action='/courses']" do
        assert_select "input[id='course_name']", 1
      end
    end

  end

#  describe "when showing a course" do
#    before do
#      @course = Course.new(:id => 1, :name => 'RACE')
#      Course.stubs(:find).with('1').returns(@course)
#      
#      get :show, :id => '1'
#    end
#
#    it "should have a link to edit the Course" do
#      assert_select "a[href='/courses/+d/edit']"
#    end
#
#    it "should have a link to show a list with all courses" do
#      assert_select "a[href='/courses']"
#    end
#  end

end

