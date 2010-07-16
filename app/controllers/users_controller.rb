class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  
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
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    @user.save
    if @user.errors.empty?
      self.current_user = @user
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!"
    else
      render :action => 'new'
    end
  end

  def activate
    self.current_user = params[:activation_code].blank? ? false : User.find_by_activation_code(params[:activation_code])
    if logged_in? && !current_user.active?
      current_user.activate
      flash[:notice] = "Signup complete!"
    end
    redirect_back_or_default('/')
  end

  def public_users
    @find_by = params[:term]
    @users = User.find_like_by_name('%' + @find_by + '%')

    render :json => @users, :template => 'users/find_like_by_name.html.erb'
  end
end
