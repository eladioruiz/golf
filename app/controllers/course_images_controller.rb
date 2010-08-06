class CourseImagesController < ApplicationController

  # GET /course_images/1
  def show
    @image = CourseImage.find(params[:id]) # id => user_id
    @course = @image.course
    #render :file => @image.filename, :type => 'image/jpg'
    send_file 'public/images/courses/' + @course.id.to_s() + '/' + @image.filename, :type => 'image/jpeg', :disposition => 'inline'
  end

end
