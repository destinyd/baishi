# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_baishi_session',
  :secret      => 'b492cf50ec7b062615696bfa16b71697a52714c733be9fa629f80fc7d0741c9a9652c272042b4f413fe3bebd6e72f4276247138d490ecfc43b1a7b60287398c5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
