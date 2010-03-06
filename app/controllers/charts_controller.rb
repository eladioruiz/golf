class ChartsController < ApplicationController
  #This is the layout which all functions in this controller make use of.
  layout "common"
  
  def pie_courses
    headers["content-type"]="text/html";
    @matches_data = []

    courses = Course.all

    courses.each do |course|
        @matches_played = Match.my_matches(current_user.id).find_all_by_course_id(course.id).size

        @matches_data<<{:course_name=>course.name,:played=>@matches_played.size}
    end # end - do.courses

    render :template => "layouts/common"
  end
end
