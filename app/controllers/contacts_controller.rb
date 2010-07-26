class ContactsController < ApplicationController
  def create
    @contact = Contact.new(params[:contact])
    @contact.save
    if @contact.errors.empty?
      flash[:envio] = "Mensaje enviado!"
      redirect_to('/microsites/ayuda')
    else
      flash[:envio] = "Error enviando su mensaje. Inténtelo más tarde."
      redirect_to('/microsites/ayuda')
    end
  end

end
