class MicrositesController < ApplicationController
 
  def ayuda
    @contact  = Contact.new
    @redirect = '/ayuda'
  end

end
