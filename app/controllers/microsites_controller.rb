class MicrositesController < ApplicationController
  before_filter :login_required
  
  def index
    @contact = Contact.new
  end

end
