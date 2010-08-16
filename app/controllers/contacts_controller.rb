class ContactsController < ApplicationController
  def create
    @contact = Contact.new(params[:contact])

    if verify_recaptcha
      @contact.save
      if @contact.errors.empty?
        UserMailer.deliver_notification_user(@contact.name,@contact.email,'Contacto recibido correctamente','','contact_success')
        UserMailer.deliver_notification_user(@contact.name,'admin@mygolfcard.es','Contacto recibido correctamente',@contact.query,'notification_admin')
        flash[:envio] = "Mensaje enviado!"
        redirect_to(@contact.redirection)
      else
        UserMailer.deliver_notification_user(@contact.name,'Contacto NO recibido',@contact.query,'notification_admin')
        flash[:envio] = "Error enviando su mensaje. Inténtelo más tarde."
        redirect_to(@contact.redirection) #'/microsites/ayuda'
      end
    else
      flash[:envio] = "Las palabras tecleadas no son correctas. Inténtelo de nuevo!"
      redirect_to(@contact.redirection) #'/microsites/ayuda'
    end
  end

end
