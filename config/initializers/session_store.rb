# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_migrainetracker_session',
  :secret      => 'fe2f1dce3a19d5c73107feefd006e9da81d58f1f9761b8e7da00228f8c7fb65f810a1f507c63540f99503be2cc64f5c14136a6d73e0ab1ba3c60255ce1a25be0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
