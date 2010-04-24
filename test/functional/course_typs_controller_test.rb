require 'test_helper'

class CourseTypsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:course_typs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course_typ" do
    assert_difference('CourseTyp.count') do
      post :create, :course_typ => { }
    end

    assert_redirected_to course_typ_path(assigns(:course_typ))
  end

  test "should show course_typ" do
    get :show, :id => course_typs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => course_typs(:one).to_param
    assert_response :success
  end

  test "should update course_typ" do
    put :update, :id => course_typs(:one).to_param, :course_typ => { }
    assert_redirected_to course_typ_path(assigns(:course_typ))
  end

  test "should destroy course_typ" do
    assert_difference('CourseTyp.count', -1) do
      delete :destroy, :id => course_typs(:one).to_param
    end

    assert_redirected_to course_typs_path
  end
end
