require 'digest/sha1'
class User < ActiveRecord::Base
  has_one :profile
  has_many :privacy_friends, :dependent => :destroy
  has_many :users, :through => :privacy_friends
  has_many :players
  has_many :matches, :through => :players, :order => 'players.id'  # Check it

  #named_scope :allowed,

  # Virtual attribute for the unencrypted password
  attr_accessor :password

  validates_presence_of     :login, :email, :name
  validates_presence_of     :password,                   :if => :password_required?
  validates_presence_of     :password_confirmation,      :if => :password_required?
  validates_length_of       :password, :within => 4..40, :if => :password_required?
  validates_confirmation_of :password,                   :if => :password_required?
  validates_length_of       :login,    :within => 3..40
  validates_length_of       :email,    :within => 3..100
  validates_uniqueness_of   :login, :email, :case_sensitive => false
  before_save :encrypt_password 

  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :name, :login, :email, :password, :password_confirmation, :handicap


  named_scope :find_like_by_name, lambda {|descr|
                                    {
                                      :select     => "users.id, users.name as value, users.name as label ",
                                      :conditions => ["name like ?", descr]
                                    }
                                  }
                                  
  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  def self.authenticate(login, password)
    u = find :first, :conditions => ['login = ?', login] # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  # Generate a token for api access
  def self.generatetoken(login, password)
    @salt = Time.now.strftime('%Y%m%d') # Date.strptime('%Y%m%d')
    Digest::SHA1.hexdigest("--#{@salt}--" + login.concat(password) + "--")
  end

  # check if token parameter is a real one
  def self.righttoken(token, user_id)
    true

    # Hay que guardar el token junto con el id de usuario generado y consultar ...
    # ... en esa tabla si no ha expirado todavía el permiso
  end

  # Encrypts some data with the salt.
  def self.encrypt(password, salt)
    Digest::SHA1.hexdigest("--#{salt}--#{password}--")
  end

  # Encrypts the password with the user salt
  def encrypt(password)
    self.class.encrypt(password, salt)
  end

  def authenticated?(password)
    crypted_password == encrypt(password)
  end

  def remember_token?
    remember_token_expires_at && Time.now.utc < remember_token_expires_at 
  end

  # These create and unset the fields required for remembering users between browser closes
  def remember_me
    remember_me_for 2.weeks
  end

  def remember_me_for(time)
    remember_me_until time.from_now.utc
  end

  def remember_me_until(time)
    self.remember_token_expires_at = time
    self.remember_token            = encrypt("#{email}--#{remember_token_expires_at}")
    save(false)
  end

  def forget_me
    self.remember_token_expires_at = nil
    self.remember_token            = nil
    save(false)
  end

  # Returns true if the user has just been activated.
  def recently_activated?
    @activated
  end

  def is_Admin?
    self.user.is_Admin?
  end

  def my_friends
    return self.getMyFriends
  end

  protected
    # before filter 
    def encrypt_password
      return if password.blank?
      self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{login}--") if new_record?
      self.crypted_password = encrypt(password)
    end
      
    def password_required?
      crypted_password.blank? || !password.blank?
    end

    def getMyFriends
      return PrivacyFriend.my_friends(self.id).map {|x| x.user}
    end
end
