class MicrositesController < ApplicationController
 
  def ayuda
    @contact  = Contact.new
    @redirect = '/microsites/ayuda'
  end

end
