class UserMailer < ActionMailer::Base
  def signup_notification(user)
    setup_email(user)
    @subject    += 'Please activate your new account'
    @body[:url]  = "http://YOURSITE/activate/#{user.activation_code}"
  
  end
  
  def activation(user)
    setup_email(user)
    @subject    += 'Su cuenta se ha creado con éxito!'
    @body[:url]  = "http://www.mygolfcard.es"
    @bcc         = "admin@mygolfcard.es"
  end

  def recover_password(user,new_password)
    setup_email(user)
    @subject    += 'Su password se ha reiniciado!'
    @body[:url]  = "http://www.mygolfcard.es"
    @body[:new_password]  = new_password
  end

  def notification_user(user,email,subject,text,template)
    setup_email(user)

    @recipients  = email
    @subject    += subject
    @body[:url]  = "http://www.mygolfcard.es"
    @body[:text] = text
    @body[:user] = user
    #@bcc         = "admin@mygolfcard.es"

    @template    = template
  end

  def notification_admin(user,subject,text)
    setup_email(user)
    @recipients  = "admin@mygolfcard.es"
    @subject    += subject
    @body[:url]  = "http://www.mygolfcard.es"
    @body[:text] = text

  end

  protected
    def setup_email(user)
      if user.class.to_s=='User'
        @recipients  = "#{user.email}"
        @body[:user] = user
      end
      @from        = "admin@mygolfcard.es"
      @subject     = "My Golf Card "
      @sent_on     = Time.now
      @content_type = "text/html"
    end
end

