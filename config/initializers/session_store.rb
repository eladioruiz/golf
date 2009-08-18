# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_golf_session',
  :secret      => 'b38456ab6451d2b9c8033ae42da69bd31ab75f483fb06b151c47108479bda154668b6f98124f7c81874d27b938b6cb499be2d56edd9373093f798ac1f4f8b1c8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
