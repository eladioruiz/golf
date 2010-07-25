class ContactsController < ApplicationController
  def create
    @contact = Contact.new(params[:contact])
    @contact.save
    if @contact.errors.empty?
      redirect_back_or_default('/microsites')
      flash[:notice] = "Mensaje enviado!"
    else
      redirect_back_or_default('/microsites')
      flash[:notice] = "Error enviando su mensaje. Inténtelo más tarde."
    end
  end

end
