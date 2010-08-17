class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem

  before_filter :current_menu
  
  # GET /users
  def index
    page = params[:page] || 1
    #@posts = Post.paginate_by_board_id @board.id, :page => page, :order => 'updated_at DESC'
    @users = User.paginate :page => page, :order => 'id DESC'
    #@matches = Match.all
  end

  # render new.rhtml
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def create

    if verify_recaptcha
      cookies.delete :auth_token
      # protects against session fixation attacks, wreaks havoc with
      # request forgery protection.
      # uncomment at your own risk
      # reset_session
      @user = User.new(params[:user])
      @user.save
      if @user.errors.empty?
        self.current_user = @user

        flash[:notice] = "Gracias por registrarse en My Golf Card!"

        UserMailer.deliver_activation(@user)

        redirect_back_or_default('/home')


      else
        flash[:notice] = "El registro en My Golf Card no ha sido correcto!"
        render :action => 'new'
      end
    else
      flash[:notice] = "Error en las palabras tecleadas!"
      render :action => 'new'
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      flash[:notice] = 'User was successfully updated.'
      #render :action => "edit"
      redirect_to(@user)
    else
      render :action => "edit"
    end

  end

  def activate
    self.current_user = params[:activation_code].blank? ? false : User.find_by_activation_code(params[:activation_code])
    if logged_in? && !current_user.active?
      current_user.activate
      flash[:notice] = "Signup complete!"
    end
    redirect_back_or_default('/home')
  end

  def public_users
    @find_by = params[:term]
    @users = User.find_like_by_name('%' + @find_by + '%')

    render :json => @users #, :template => 'users/find_like_by_name.html.erb'
  end

  def recover_password
    @email = params[:user][:email]
    @user = User.find_by_email(@email)

    if @user
      @new_password = generate_random_password()

      @user.password = @new_password
      @user.password_confirmation = @new_password
      
      if @user.update_attributes(params[:user])
        flash[:notice] = "Password reseteada correctamente!"
        UserMailer.deliver_recover_password(@user,@new_password)
      else
        flash[:notice] = "La password no se ha podido resetear correctamente!"
      end
    else
      flash[:notice] = "El mail indicado no existe!"
    end

    redirect_back_or_default('/')
  end

private

  def current_menu
    @current_menu = {'init' => '', 'matches' => '', 'courses' => '', 'charts' => '', 'personaldata' => 'current'}
  end

  def generate_random_password
    #(1..8).each do
    #end
    "fulanitez"
  end

end
