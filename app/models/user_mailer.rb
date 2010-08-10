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
  end

  def recover_password(user,new_password)
    setup_email(user)
    @subject    += 'Su password se ha reiniciado!'
    @body[:url]  = "http://www.mygolfcard.es"
    @body[:new_password]  = new_password
  end

  protected
    def setup_email(user)
      @recipients  = "#{user.email}"
      @from        = "admin@mygolfcard.es"
      @bcc         = "info@mygolfcard.es"
      @subject     = "My Golf Card "
      @sent_on     = Time.now
      @content_type = "text/html"
      @body[:user] = user
    end
end
